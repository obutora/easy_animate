
import 'easy_animate_platform_interface.dart';

class EasyAnimate {
  Future<String?> getPlatformVersion() {
    return EasyAnimatePlatform.instance.getPlatformVersion();
  }
}
