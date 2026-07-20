import Foundation

final class SecurityScanner {

    private let developerChecker = DeveloperChecker()
    private let simulatorChecker = SimulatorChecker()

    func scan() -> [String: Any?] {

        return [
            Constants.keyDeveloperMode: developerChecker.isEnabled(),

            // Not supported on iOS
            Constants.keyUsbDebugging: nil,

            // TODO: Implement debugger detection
            Constants.keyDebuggerAttached: false,

            // Simulator detection
            Constants.keyVirtualDevice: simulatorChecker.isSimulator(),

            // TODO: Implement jailbreak detection
            Constants.keyDeviceCompromised: false
        ]
    }
}