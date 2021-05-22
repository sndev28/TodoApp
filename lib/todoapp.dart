import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/deleted_page.dart';
import 'screens/settings_home_page.dart';
import 'screens/sub_settings/infopage.dart';
import 'screens/sub_settings/themepage.dart';
import 'styles/app_theme.dart';

const HomeDir = '/';
const DeletedDir = '/deleted';
const SettingsDir = '/settings';
const SettingsInfoDir = '/settings/info';
const SettingsThemeDir = '/settings/theme';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(Brightness.light),
      onGenerateRoute: _routes(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;

      Widget screen;

      switch (settings.name) {
        case HomeDir:
          screen = Home();
          break;
        case DeletedDir:
          screen = DeletedListPage(arguments['deletedList']);
          break;
        case SettingsDir:
          screen = SettingsHomePage();
          break;
        case SettingsInfoDir:
          screen = SettingsInfoPage();
          break;
        case SettingsThemeDir:
          screen = SettingsThemePage();
          break;
        default:
          return null;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
