import 'package:simple_animations/simple_animations.dart';

enum AnimateType {
  once,
  mirror,
  loop,
}

extension AnimateTypeExtension on AnimateType {
  Control get getController {
    switch (this) {
      case AnimateType.once:
        return Control.play;
      case AnimateType.mirror:
        return Control.mirror;
      case AnimateType.loop:
        return Control.loop;
    }
  }
}
