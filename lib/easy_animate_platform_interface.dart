import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_animate_method_channel.dart';

abstract class EasyAnimatePlatform extends PlatformInterface {
  /// Constructs a EasyAnimatePlatform.
  EasyAnimatePlatform() : super(token: _token);

  static final Object _token = Object();

  static EasyAnimatePlatform _instance = MethodChannelEasyAnimate();

  /// The default instance of [EasyAnimatePlatform] to use.
  ///
  /// Defaults to [MethodChannelEasyAnimate].
  static EasyAnimatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EasyAnimatePlatform] when
  /// they register themselves.
  static set instance(EasyAnimatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
