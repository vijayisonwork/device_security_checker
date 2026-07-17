#include "include/device_security_checker/device_security_checker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "device_security_checker_plugin.h"

void DeviceSecurityCheckerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  device_security_checker::DeviceSecurityCheckerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
