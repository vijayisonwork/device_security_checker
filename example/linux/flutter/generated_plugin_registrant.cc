//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <device_security_checker/device_security_checker_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) device_security_checker_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DeviceSecurityCheckerPlugin");
  device_security_checker_plugin_register_with_registrar(device_security_checker_registrar);
}
