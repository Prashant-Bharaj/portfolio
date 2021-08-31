import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/animations/bottomAnimation.dart';
import 'package:portfolio/view/widgets/customTextHeading.dart';
import 'package:portfolio/view/widgets/projectCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';

class ContactDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> kContactDetails = [
      "Prashant Bharaj",
      "Prashant Bharaj",
      "Telegram: @prashantbharaj",
      "prashant.bharaj@gmail.com"
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(
              text: "\n${AppLocalizations.of(context)!.contact_header}"),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                kContactIcons.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: WidgetAnimator(
                    child: ProjectCard(
                      needToCopy: index == 3 ? true : null,
                      cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                      cardHeight: width < 1200 ? height * 0.28 : height * 0.25,
                      projectLink: index == 2
                          ? "https://t.me/prashantbharaj"
                          : index == 0
                              ? 'https://github.com/Prashant-Bharaj'
                              : index == 1? 'https://www.linkedin.com/in/prashantbharaj' : null,
                      projectIconData: kContactIcons[index],
                      projectTitle: kContactTitles[index],
                      projectDescription: kContactDetails[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
