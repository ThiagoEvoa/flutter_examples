import 'dart:ui';

class ThemeModeNotifier {
  ThemeModeNotifier(this.appBrightness);

  final appBrightness;

  changeBrightness({required Brightness brightness}) {
    appBrightness.value = brightness;
  }
}
