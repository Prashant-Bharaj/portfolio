import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/widgets/customTextHeading.dart';
import 'package:portfolio/view/widgets/projectCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';

class ContactMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> kContactDetails = ["Prashant Singh", "Prashant Singh", "Telegram: @prashantbharaj", "prashant.bharaj@gmail.com"];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomSectionHeading(text: "\n${AppLocalizations.of(context)!.contact_header}"),
          SizedBox(height: 5,),
          CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int itemIndex, int index) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProjectCard(
                needToCopy: index == 3? true : null,
                projectLink: index == 2? "https://t.me/prashantbharaj" : index == 0? 'https://github.com/Prashant-Bharaj': index == 1? 'https://www.linkedin.com/in/prashantbharaj' : null,
                cardWidth: width > 480 ? width * 0.5 : width * 0.8,
                projectIconData: kContactIcons[index],
                projectTitle: kContactTitles[index],
                projectDescription: kContactDetails[index],
              ),
            ),
            options: CarouselOptions(
                height: height * 0.3,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: false),
          ),
        ],
      ),
    );
  }
}
