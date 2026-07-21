import Foundation

final class SecurityScanner {

    private let simulatorChecker = SimulatorChecker()
    private let debuggerChecker = DebuggerChecker()
    private let jailBreakerChecker = JailBreakerChecker()

    func scan() -> [String: Any?] {

        return [
            Constants.keyDeveloperMode: nil,
            Constants.keyUsbDebugging: nil,
            Constants.keyDebuggerAttached: debuggerChecker.isDebuggerAttached(),
            Constants.keyVirtualDevice: simulatorChecker.isSimulator(),
            Constants.keyJailBroken: jailBreakerChecker.isJailBroken(),
            Constants.keyDeviceCompromised: jailBreakerChecker.isJailBroken(),
        ]
    }
}