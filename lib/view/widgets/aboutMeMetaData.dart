import 'package:flutter/material.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:provider/provider.dart';

class AboutMeMetaData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeMetaData(
      {Key? key, required this.data, required this.information, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Align(
        alignment: alignment ?? Alignment.center,
        child: SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$data: ",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.018,
                  color: _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              TextSpan(
                text: " $information\n",
                style: TextStyle(
                   fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.018,
                  letterSpacing: 1.0,
                  color: _themeProvider.lightTheme ? Colors.grey[600] : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
