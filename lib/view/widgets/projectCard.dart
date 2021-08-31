import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'adaptiveText.dart';

class ProjectCard extends StatefulWidget {
  final bool? needToCopy;
  final String? projectIcon;
  final IconData? projectIconData;
  final String projectTitle;
  final String projectDescription;
  final String? projectLink;
  final double cardWidth;
  final double? cardHeight;
  final String? backImage;
  final Widget? bottomWidget;
  final bool? haveAdvice;

  const ProjectCard({
    Key? key,
    this.backImage,
    this.bottomWidget,
    this.projectIcon,
    required this.projectTitle,
    required this.projectDescription,
    this.projectLink,
    this.projectIconData,
    required this.cardWidth,
    this.cardHeight,
    this.needToCopy, this.haveAdvice,
  }) : super(key: key);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (widget.projectLink != null) {
          launch(widget.projectLink!);
        } else if (widget.needToCopy != null) {
          Clipboard.setData(new ClipboardData(text: widget.projectDescription))
              .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Email address copied to clipboard")));
          });
        }
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
          border: Border(
            bottom: isHover
                ? BorderSide(
                    color: kPrimaryColor,
                    width: 3.0,
                  )
                : BorderSide(
                    color: _themeProvider.lightTheme
                        ? Colors.white
                        : Colors.grey[900]!,
                  ),
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: kPrimaryColor.withAlpha(100),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            widget.projectIcon!,
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                widget.projectIcon!,
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                widget.projectTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: height * 0.015,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: kPrimaryColor,
                        size: height * 0.1,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : SizedBox(),
                (width > 1135 || width < 950)
                    ? AdaptiveText(
                        widget.projectTitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.02,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.grey[900]
                              : Colors.white,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                Flexible(
                  child: AdaptiveText(
                    widget.projectDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: height * 0.015,
                        letterSpacing: 2.0,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w400,
                        height: width >= 600 ? 2.0 : 1.2),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                widget.haveAdvice != null? widget.haveAdvice!?
                Text(
                  AppLocalizations.of(context)!.projects_advice,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ) : Container() : Container()
                ,
                widget.bottomWidget ?? Container(),
              ],
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.backImage != null
                    ? Image.asset(widget.backImage!)
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

copyToClipBoard({required String projectTitle, BuildContext? context}) {
  Clipboard.setData(new ClipboardData(text: projectTitle)).then((_) {
    ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text("Email address copied to clipboard")));
  });
}
