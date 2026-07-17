import Flutter
import UIKit

public class DeviceSecurityCheckerPlugin: NSObject, FlutterPlugin {

    private var dispatcher: SecurityDispatcher!

    public static func register(with registrar: FlutterPluginRegistrar) {

        let channel = FlutterMethodChannel(
            name: Constants.channel,
            binaryMessenger: registrar.messenger()
        )

        let instance = DeviceSecurityCheckerPlugin()

        instance.dispatcher = SecurityDispatcher()

        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(
        _ call: FlutterMethodCall,
        result: @escaping FlutterResult
    ) {

        dispatcher.handle(call, result: result)

    }

}