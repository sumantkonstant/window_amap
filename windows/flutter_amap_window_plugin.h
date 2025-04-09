#ifndef FLUTTER_PLUGIN_FLUTTER_AMAP_WINDOW_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_AMAP_WINDOW_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_amap_window {

class FlutterAmapWindowPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterAmapWindowPlugin();

  virtual ~FlutterAmapWindowPlugin();

  // Disallow copy and assign.
  FlutterAmapWindowPlugin(const FlutterAmapWindowPlugin&) = delete;
  FlutterAmapWindowPlugin& operator=(const FlutterAmapWindowPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_amap_window

#endif  // FLUTTER_PLUGIN_FLUTTER_AMAP_WINDOW_PLUGIN_H_
