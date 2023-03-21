import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'easy_animate_platform_interface.dart';

/// An implementation of [EasyAnimatePlatform] that uses method channels.
class MethodChannelEasyAnimate extends EasyAnimatePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('easy_animate');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
