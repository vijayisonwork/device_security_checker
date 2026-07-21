import Foundation
import Darwin

final class JailBreakerChecker {
    private let suspiciousPaths = [
        "/Applications/Cydia.app",
        "/Applications/Sileo.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt"
    ]

    func isJailbroken() -> Bool {
        return !detect().isEmpty
    }

    func detect() -> [JailbreakDetectionType] {

        var reasons: [JailbreakDetectionType] = []

        if checkSuspiciousFiles() {
            reasons.append(.suspiciousFiles)
        }

        if checkWritableSystem() {
            reasons.append(.writableSystem)
        }

        if checkSymbolicLinks() {
            reasons.append(.symbolicLinks)
        }

        if checkFork() {
            reasons.append(.fork)
        }

        if checkInjectedLibraries() {
            reasons.append(.injectedLibraries)
        }

        return reasons
    }

    private func checkSuspiciousFiles() -> Bool {
        return suspiciousPaths.contains { FileManager.default.fileExists(atPath: $0) }
    }

    private func checkWritableSystem() -> Bool {
        let testPath = "/private/jailbreak_test.txt"

        do {
            try "test".write(toFile: testPath,
                             atomically: true,
                             encoding: .utf8)

            try FileManager.default.removeItem(atPath: testPath)

            return true
        } catch {
            return false
        }
    }

    private func checkSymbolicLinks() -> Bool {
        let paths = [
            "/Applications",
            "/Library/Ringtones",
            "/Library/Wallpaper",
            "/usr/arm-apple-darwin9",
            "/usr/include",
            "/usr/libexec",
            "/usr/share"
        ]

        let fileManager = FileManager.default

        for path in paths {
            do {
                let attributes = try fileManager.attributesOfItem(atPath: path)

                if let fileType = attributes[.type] as? FileAttributeType,
                   fileType == .typeSymbolicLink {
                    return true
                }
            } catch {
                continue
            }
        }

        return false
    }

    private func checkFork() -> Bool {
        let pid = fork()

        if pid >= 0 {
            if pid == 0 {
                exit(0)
            }
            return true
        }

        return false
    }

    private func checkInjectedLibraries() -> Bool {
        let suspiciousLibraries = [
            "MobileSubstrate",
            "SubstrateLoader",
            "Substitute",
            "libhooker",
            "FridaGadget"
        ]

        let imageCount = _dyld_image_count()

        for i in 0..<imageCount {
            guard let cName = _dyld_get_image_name(i),
                  let imageName = String(validatingUTF8: cName) else {
                continue
            }

            for library in suspiciousLibraries {
                if imageName.localizedCaseInsensitiveContains(library) {
                    return true
                }
            }
        }

        return false
    }
}