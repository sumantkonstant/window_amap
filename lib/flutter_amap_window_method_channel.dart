import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_amap_window_platform_interface.dart';

/// An implementation of [FlutterDemoPlatform] that uses method channels.
class MethodChannelFlutterAmapWindow extends FlutterAmapWindowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_amap_window');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
