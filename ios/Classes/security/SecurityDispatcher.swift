import Flutter

final class SecurityDispatcher {

    private let scanner = SecurityScanner()

    func handle(
        call: FlutterMethodCall,
        result: @escaping FlutterResult
    ) {

        switch call.method {

        case Constants.methodInitialize:
            result(nil)

        case Constants.methodScanDevice:
            result(scanner.scan())

        default:
            result(FlutterMethodNotImplemented)
        }
    }
}