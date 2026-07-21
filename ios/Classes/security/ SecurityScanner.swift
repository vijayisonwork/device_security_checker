import Foundation

final class SecurityScanner {

    private let simulatorChecker = SimulatorChecker()
    private let debuggerChecker = DebuggerChecker()

    func scan() -> [String: Any?] {

        return [
            Constants.keyDeveloperMode: nil,
            Constants.keyUsbDebugging: nil,
            Constants.keyDebuggerAttached: debuggerChecker.isDebuggerAttached(),
            Constants.keyVirtualDevice: simulatorChecker.isSimulator(),
            Constants.keyDeviceCompromised: false
        ]
    }
}