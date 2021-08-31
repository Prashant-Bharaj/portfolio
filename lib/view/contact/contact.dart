import 'package:flutter/material.dart';

import 'contact_desktop.dart';
import 'contact_mobile.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double deviceWidth = constraints.maxWidth;
      if (deviceWidth >= 950) {
        return ContactDesktop();
      }
      return ContactMobile();
    });
  }
}