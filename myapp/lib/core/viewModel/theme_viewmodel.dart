import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeViewModel extends StateNotifier<bool> {
  ThemeViewModel() : super(false);

  changeTheme({@required bool isDarkTheme}) {
    state = isDarkTheme;
  }
}
