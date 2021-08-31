import 'package:flutter/material.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  SocialMediaIconBtn(
      {required this.icon, required this.socialLink, required this.height, required this.horizontalPadding});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        highlightColor: kPrimaryColor,
        splashRadius: 20,
        icon: Image.network(
          icon,
          color: _themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        iconSize: height,
        onPressed: () => launchURL(socialLink),
        hoverColor: kPrimaryColor,
      ),
    );
  }
}
