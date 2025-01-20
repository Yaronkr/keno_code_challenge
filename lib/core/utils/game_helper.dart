import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:keno_code_challenge/core/theme.dart';

abstract class GameHelper {
  static Color getRandomColor() {
    int colorListLength = DefaultColors.ballsColors.length;
    return DefaultColors.ballsColors[Random().nextInt(colorListLength)];
  }

  static int getRandomNumber() => Random().nextInt(80) + 1;

  static double getWidgetSpacing() {
    if (kIsWeb) {
      return 32.0;
    } else if (Platform.isIOS || Platform.isAndroid) {
      return 8.0;
    } else {
      return 8.0;
    }
  }
}
