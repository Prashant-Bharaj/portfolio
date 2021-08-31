import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'about_desktop.dart';
import 'about_mobile.dart';
import 'about_tab.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double deviceWidth = constraints.maxWidth;
      if (deviceWidth >= 950) {
        return AboutDesktop();
      }
      else if ( deviceWidth >=770 ) {
        return AboutTab();
      }
      return AboutMobile();
    });
  }
}
