import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _lightTheme = true;
  bool get lightTheme => _lightTheme;
  ScrollController scrollController = ScrollController();


  set scroll(int i) {
    scrollController.animateTo(
      i == 0 ? 100 : 0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  changeTheme() {
    _lightTheme = !_lightTheme;

    notifyListeners();
  }
}
