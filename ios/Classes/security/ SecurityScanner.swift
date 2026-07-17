import Foundation

final class SecurityScanner {

    private let developerChecker = DeveloperChecker()

    private let simulatorChecker = SimulatorChecker()

    func scan() -> [String: Any?] {

        return [

            Constants.keyDeveloperMode: developerChecker.isEnabled(),

            Constants.keyUsbDebugging: nil,

            Constants.keyDebuggerAttached: false,

            Constants.keyVirtualDevice: simulatorChecker.isSimulator(),

            Constants.keyDeviceCompromised: false

        ]

    }

}