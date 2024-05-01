import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';

class ThemeStyles {
  static ThemeData themeData(bool lightTheme, BuildContext buildContext) {
    return lightTheme
        ?
        // Light Theme
        ThemeData(
            primarySwatch: Colors.red,
            primaryColorLight: kPrimaryColor,
            brightness: Brightness.light,
            primaryColor: kPrimaryColor,
            hintColor: Colors.black,
            highlightColor: Colors.black,
            canvasColor: Colors.white,
          )
        // Dark Theme
        : ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            primaryColorDark: kPrimaryColor,
            primaryColor: kPrimaryColor,
            hintColor: kPrimaryColor,
            highlightColor: kPrimaryColor,
            canvasColor: Colors.white,
          );
  }
}