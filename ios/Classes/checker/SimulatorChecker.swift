import Foundation

final class SimulatorChecker {

    func isSimulator() -> Bool {

        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif

    }

}