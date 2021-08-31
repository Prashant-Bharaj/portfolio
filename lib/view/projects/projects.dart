import 'package:flutter/widgets.dart';
import 'package:portfolio/view/projects/projects_desktop.dart';
import 'package:portfolio/view/projects/projects_mobile.dart';

class Projects extends StatelessWidget {
  const Projects({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double deviceWidth = constraints.maxWidth;
      if (deviceWidth >= 950) {
        return ProjectsDesktop();
      }
      // else if ( deviceWidth >=770 ) {
      //   return AboutTab();
      // }
      return  ProjectsMobile();
    });
  }
}