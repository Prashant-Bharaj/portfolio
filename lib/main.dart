import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/provider/locale_provider.dart';
import 'package:portfolio/provider/theme_provider/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LocaleProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            )
        ],
        child: Portfolio()
        );
  }
}
