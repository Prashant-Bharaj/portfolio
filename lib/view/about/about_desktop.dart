import 'package:flutter/material.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:portfolio/view/widgets/aboutMeMetaData.dart';
import 'package:portfolio/view/widgets/adaptiveText.dart';
import 'package:portfolio/view/widgets/customTextHeading.dart';
import 'package:portfolio/view/widgets/toolsTechWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants.dart';

class AboutDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        children: [
          CustomSectionHeading(
              text: AppLocalizations.of(context)!.about_header),
          Row(
            children: [
              // Container(height: height * 0.7, width: width * 0.3,),
              // Expanded(child: Placeholder(fallbackHeight: height * 0.7,)),
              Expanded(
                child: Image.asset(
                  'assets/avatar.jpg',
                  height: height * 0.7,
                ),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        AppLocalizations.of(context)!.about_who,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        AppLocalizations.of(context)!.about_text,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.02,
                          color: _themeProvider.lightTheme
                              ? Colors.grey[500]
                              : Colors.white60,
                          height: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[800]!, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        AppLocalizations.of(context)!.about_technologies,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                            color: kPrimaryColor, fontSize: height * 0.018),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < kTools.length; i++)
                              ToolTechWidget(
                                techName: kTools[i],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[800]!, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AboutMeMetaData(
                            data: AppLocalizations.of(context)!.about_name,
                            information: AppLocalizations.of(context)!.name,
                          ),
                          AboutMeMetaData(
                            data: "Email",
                            information: "prashant.bharaj@gmail.com",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
