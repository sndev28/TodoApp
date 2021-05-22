import 'package:flutter/material.dart';
import 'text_theme.dart';

ThemeData theme(Brightness brightness) {
  return ThemeData(
      brightness: brightness,
      primaryColor: Colors.red[300],
      // canvasColor: Colors.white,
      textTheme: TextTheme(
        headline6: titleTheme,
        bodyText2: bodyTheme,
      ));
}
