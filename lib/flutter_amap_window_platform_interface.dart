import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_amap_window_method_channel.dart';

abstract class FlutterAmapWindowPlatform extends PlatformInterface {
  /// Constructs a FlutterDemoPlatform.
  FlutterAmapWindowPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAmapWindowPlatform _instance = MethodChannelFlutterAmapWindow();

  /// The default instance of [FlutterAmapWindowPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDemo].
  static FlutterAmapWindowPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDemoPlatform] when
  /// they register themselves.
  static set instance(FlutterAmapWindowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
