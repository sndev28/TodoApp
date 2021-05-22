import 'package:flutter/material.dart';
import '../styles/text_theme.dart';
import '../styles/card.dart';
import '../todoapp.dart';

class SettingsHomePage extends StatelessWidget {
  Widget _settingsHomePage(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12.0),
      children: [
        _themePage(context),
        _infoPage(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: titleTheme,
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: _settingsHomePage(context),
    );
  }

  Widget _themePage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          color: Colors.red[50],
          shape: todoListCardShape,
          child: ListTile(
            title: Text(
              'Themes',
              style: bodyTheme,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Navigator.pushNamed(context, SettingsThemeDir);
            },
          ),
        ));
  }

  Widget _infoPage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          color: Colors.red[50],
          shape: todoListCardShape,
          child: ListTile(
            title: Text(
              'Info',
              style: bodyTheme,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Navigator.pushNamed(context, SettingsInfoDir);
            },
          ),
        ));
  }
}
