import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale = Locale('en');

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
