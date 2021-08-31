import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:provider/provider.dart';

import 'adaptiveText.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      style: TextStyle(
                          fontFamily: 'Montserrat',

        fontSize: MediaQuery.of(context).size.height * 0.075,
        fontWeight: FontWeight.w100,
        letterSpacing: 1.0,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
      ),
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w200,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
      ),
    );
  }
}