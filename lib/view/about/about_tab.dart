import 'package:flutter/services.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:portfolio/view/widgets/aboutMeMetaData.dart';
import 'package:portfolio/view/widgets/customTextHeading.dart';
import 'package:portfolio/view/widgets/toolsTechWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants.dart';

class AboutTab extends StatelessWidget {
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
        children: [
          CustomSectionHeading(
              text: AppLocalizations.of(context)!.about_header),
          Container(
            clipBehavior: Clip.none,
            height: height * 0.3,
            width: width * 0.3,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                  'assets/avatar.jpg',
                  // height: height * 0.27,
                  // fit: BoxFit.fill,
                ))),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.032,
          ),
          Text(
            AppLocalizations.of(context)!.about_who,
            style: GoogleFonts.montserrat(
              fontSize: height * 0.035,
              fontWeight: FontWeight.w400,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.about_text,
            style: GoogleFonts.montserrat(
              fontSize: height * 0.02,
              color: Colors.grey[500],
              height: 2.0,
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[900]!, width: 2.0),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.about_technologies,
              style: GoogleFonts.montserrat(
                  color: kPrimaryColor, fontSize: height * 0.018),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < kTools.length; i++)
                ToolTechWidget(
                  techName: kTools[i],
                ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[900]!, width: 2.0),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Row(
            children: [
              AboutMeMetaData(
                data: AppLocalizations.of(context)!.about_name,
                information: AppLocalizations.of(context)!.name,
              ),
              SizedBox(
                width: width > 710 ? width * 0.2 : width * 0.05,
              ),
              InkWell(
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: kPrimaryColor,
                      content:
                          Text(AppLocalizations.of(context)!.about_advice)));
                },
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: "prashant.bharaj@gmail.com"))
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
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}
