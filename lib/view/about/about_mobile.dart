import 'package:flutter/services.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:portfolio/view/widgets/aboutMeMetaData.dart';
import 'package:portfolio/view/widgets/customTextHeading.dart';
import 'package:portfolio/view/widgets/toolsTechWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../constants.dart';

class AboutMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ),
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSectionHeading(
              text: AppLocalizations.of(context)!.about_header),
          Container(
            height: height * 0.27,
            width: width * 0.27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://avatars.githubusercontent.com/u/52974592?v=4"),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.about_who,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: height * 0.022,
              fontWeight: FontWeight.w400,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.about_text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: height * 0.018,
              color: Colors.grey[500],
              height: 1.5,
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[900]!, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.about_technologies,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor,
                  fontSize: height * 0.015),
            ),
          ),
          // ResponsiveRowColumn(layout: ResponsiveRowColumnType.ROW, children: [
          //   for (int i = 0; i < kTools.length; i++)
          //     ResponsiveRowColumnItem(
          //       child: ToolTechWidget(
          //         techName: kTools[i],
          //       ),
          //     ),
          // ]),+
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              for (int i = 0; i < kTools.length; i++)
                ToolTechWidget(
                  techName: kTools[i],
                ),
            ],
          ),
          // Row(
          //   children: [
          //     for (int i = 5; i < kTools.length; i++)
          //       ToolTechWidget(
          //         techName: kTools[i],
          //       ),
          //   ],
          // ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[900]!, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          AboutMeMetaData(
            data: AppLocalizations.of(context)!.about_name,
            information: AppLocalizations.of(context)!.name,
            alignment: Alignment.centerLeft,
          ),
          InkWell(
            onDoubleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: kPrimaryColor,
                  content: Text(AppLocalizations.of(context)!.about_advice)));
            },
            onTap: () {
              Clipboard.setData(
                      new ClipboardData(text: "prashant.bharaj@gmail.com"))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: kPrimaryColor,
                    content: Text("Email address copied to clipboard")));
              });
            },
            child: AboutMeMetaData(
              data: "Email",
              information: "prashant.bharaj@gmail.com",
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
        ],
      ),
    );
  }
}
