#ifndef FLUTTER_PLUGIN_FLUTTER_DEMO_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_DEMO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_amap_window {

class FlutterDemoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterDemoPlugin();

  virtual ~FlutterDemoPlugin();

  // Disallow copy and assign.
  FlutterDemoPlugin(const FlutterDemoPlugin&) = delete;
  FlutterDemoPlugin& operator=(const FlutterDemoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_amap_window

#endif  // FLUTTER_PLUGIN_FLUTTER_DEMO_PLUGIN_H_
