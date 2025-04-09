#include "include/flutter_amap_window/flutter_amap_window_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_amap_window_plugin.h"

void FlutterAmapWindowPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_amap_window::FlutterAmapWindowPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
