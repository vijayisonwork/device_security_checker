#ifndef FLUTTER_PLUGIN_DEVICE_SECURITY_CHECKER_PLUGIN_H_
#define FLUTTER_PLUGIN_DEVICE_SECURITY_CHECKER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace device_security_checker {

class DeviceSecurityCheckerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DeviceSecurityCheckerPlugin();

  virtual ~DeviceSecurityCheckerPlugin();

  // Disallow copy and assign.
  DeviceSecurityCheckerPlugin(const DeviceSecurityCheckerPlugin&) = delete;
  DeviceSecurityCheckerPlugin& operator=(const DeviceSecurityCheckerPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace device_security_checker

#endif  // FLUTTER_PLUGIN_DEVICE_SECURITY_CHECKER_PLUGIN_H_
