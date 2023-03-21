import 'package:flutter_test/flutter_test.dart';
import 'package:easy_animate/easy_animate.dart';
import 'package:easy_animate/easy_animate_platform_interface.dart';
import 'package:easy_animate/easy_animate_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEasyAnimatePlatform
    with MockPlatformInterfaceMixin
    implements EasyAnimatePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EasyAnimatePlatform initialPlatform = EasyAnimatePlatform.instance;

  test('$MethodChannelEasyAnimate is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEasyAnimate>());
  });

  test('getPlatformVersion', () async {
    EasyAnimate easyAnimatePlugin = EasyAnimate();
    MockEasyAnimatePlatform fakePlatform = MockEasyAnimatePlatform();
    EasyAnimatePlatform.instance = fakePlatform;

    expect(await easyAnimatePlugin.getPlatformVersion(), '42');
  });
}
