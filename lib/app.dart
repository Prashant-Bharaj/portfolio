import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:portfolio/view/mainPage.dart';
import 'package:provider/provider.dart';

import 'provider/locale_provider.dart';
import 'provider/theme_provider/themeStyles.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localProvider = Provider.of<LocaleProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _localProvider.locale ?? Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeStyles.themeData(_themeProvider.lightTheme, context),
      initialRoute: '/',
      routes: {
        "/": (context) => MainPage(),
      },
    );
  }
}
