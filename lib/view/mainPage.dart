import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/provider/locale_provider.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:portfolio/view/contact/contact.dart';
import 'package:portfolio/view/projects/projects.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'about/about.dart';
import 'animations/bottomAnimation.dart';
import 'animations/entranceFader.dart';
import 'widgets/arrowOnTop.dart';
import 'widgets/socialMediaIcon.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String dropdownValue = 'EN';
  bool isPressed = false;
  bool isEnglish = true;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  final List<IconData> _sectionsIcons = [
    Icons.person,
    Icons.build,
    Icons.phone,
  ];
  List<String> _sectionsName = ["ABOUT", "PROJECTS", "CONTACT"];

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _sectionsName = [
      AppLocalizations.of(context)!.navbar_about,
      AppLocalizations.of(context)!.navbar_projects,
      AppLocalizations.of(context)!.navbar_contact
    ];
    super.didChangeDependencies();
  }

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0)
      return About(); //About
    else if (i == 1)
      return Projects(); //Portfolio
    else if (i == 2)
      return Contact(); //Contact
    else if (i == 3)
      return Container();
    else
      return Container();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _localProvider = Provider.of<LocaleProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _themeProvider.lightTheme ? Colors.white : Colors.black,
      appBar: MediaQuery.of(context).size.width < 760
          ? PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                iconTheme: IconThemeData(
                    color: _themeProvider.lightTheme
                        ? Colors.black
                        : Colors.white),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  )
                ],
              ),
            )
          : _appBarTabDesktop(_themeProvider, _localProvider),
      drawer: MediaQuery.of(context).size.width < 760
          ? _appBarMobile(_themeProvider, _localProvider)
          : null,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SectionsBody(
              scrollController: _scrollController,
              sectionsLength: _sectionsIcons.length,
              sectionWidget: sectionWidget,
            ),
            _isScrollingDown
                ? Positioned(
                    bottom: 90,
                    right: 0,
                    child: EntranceFader(
                        offset: Offset(0, 20),
                        child: ArrowOnTop(
                          onPressed: () {
                            _scroll(0);
                            _isScrollingDown = false;
                            setState(() {});
                          },
                        )))
                : Container()
          ],
        ),
      ),
    );
  }

  PreferredSize _appBarTabDesktop(
      ThemeProvider _themeProvider, LocaleProvider _localProvider) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        elevation: 0.0,
        backgroundColor:
            _themeProvider.lightTheme ? Colors.white : Colors.black,
        title: MediaQuery.of(context).size.width < 780
            ? EntranceFader(
                duration: Duration(milliseconds: 250),
                offset: Offset(0, -10),
                delay: Duration(seconds: 3),
              )
            : EntranceFader(
                offset: Offset(0, -10),
                duration: Duration(milliseconds: 250),
                delay: Duration(milliseconds: 100),
              ),
        actions: [
          SizedBox(
            width: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              kSocialIcons.length,
              (index) => WidgetAnimator(
                child: SocialMediaIconBtn(
                  icon: kSocialIcons[index],
                  socialLink: kSocialLinks[index],
                  height: height * 0.035,
                  horizontalPadding: width * 0.005,
                ),
              ),
            ),
          ),
          Spacer(),
          for (int i = 0; i < _sectionsName.length; i++)
            _appBarActions(
                _sectionsName[i], i, _sectionsIcons[i], _themeProvider),
          const SizedBox(width: 15.0),
          // Container(
          //     padding: EdgeInsets.only(top: 4),
          //     child: dropDownButtonBuild(_localProvider, _themeProvider)),
          const SizedBox(width: 15.0),
          Icon(
            Icons.dark_mode_outlined,
            color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          ),
          SizedBox(
            height: 30.0,
            child: Switch(
              inactiveTrackColor: Colors.grey,
              value: !_themeProvider.lightTheme,
              onChanged: (value) {
                _themeProvider.changeTheme();
              },
              activeColor: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 15.0),
        ],
      ),
    );
  }

  // DropdownButton<String> dropDownButtonBuild(LocaleProvider _localProvider, ThemeProvider _themeProvider) {
  //   return DropdownButton(
  //     dropdownColor: _themeProvider.lightTheme ? Colors.white: Colors.black,
  //     style: TextStyle(
  //       color: _themeProvider.lightTheme? Colors.black : Colors.white
  //     ),
  //     underline: Container(
  //       height: 0,
  //       width: 0,
  //     ),
  //     value: dropdownValue,
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownValue = newValue!;
  //       });
  //       newValue == 'RU'
  //           ? _localProvider.setLocale(Locale('ru'))
  //           : _localProvider.setLocale(Locale('en'));
  //     },
  //     items: <String>['EN', "RU"].map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }

  Widget _appBarActions(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -10),
            delay: Duration(milliseconds: 100),
            duration: Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  Widget _appBarMobile(
      ThemeProvider _themeProvider, LocaleProvider _localProvider) {
    Color? switchColor =
        _themeProvider.lightTheme ? Colors.black : Colors.white;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Material(
        color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: switchColor,
                ),
                title: Text(
                    AppLocalizations.of(context)!.about_mobile_tile_darkmode,
                    style: TextStyle(color: switchColor)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !_themeProvider.lightTheme,
                  onChanged: (value) {
                    _themeProvider.changeTheme();
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.language,
              //     color: switchColor,
              //   ),
              //   title: Text(
              //       AppLocalizations.of(context)!.about_mobile_tile_language,
              //       style: TextStyle(color: switchColor)),
              //   trailing: dropDownButtonBuild(
              //     _localProvider,
              //     _themeProvider,
              //   ),
              // ),
              Divider(
                color:
                    _themeProvider.lightTheme ? Colors.grey[600] : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(
                    _sectionsName[i], i, _sectionsIcons[i], _themeProvider),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  kSocialIcons.length,
                  (index) => WidgetAnimator(
                    child: SocialMediaIconBtn(
                      icon: kSocialIcons[index],
                      socialLink: kSocialLinks[index],
                      height: height * 0.035,
                      horizontalPadding: width * 0.005,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionsBody extends StatelessWidget {
  final ScrollController scrollController;
  final int sectionsLength;
  final Widget Function(int) sectionWidget;

  const SectionsBody({
    Key? key,
    required this.scrollController,
    required this.sectionsLength,
    required this.sectionWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: sectionsLength,
        itemBuilder: (context, index) => sectionWidget(index),
      ),
    );
  }
}
