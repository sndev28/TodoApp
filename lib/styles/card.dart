import 'package:flutter/material.dart';
import 'text_theme.dart';

const todoListCardShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)));

Widget defaultCard(String cardTitle) {
  return Card(
      elevation: 8,
      color: Colors.red[100],
      shape: todoListCardShape,
      child: ListTile(
        title: Text(
          cardTitle,
          style: bodyTheme,
        ),
      ));
}

Widget defaultCardWithSubtitle(
  String cardTitle,
  String cardSubTitle,
) {
  return Card(
      elevation: 8,
      color: Colors.red[100],
      shape: todoListCardShape,
      child: ListTile(
        title: Text(
          cardTitle,
          style: bodyTheme,
        ),
        subtitle: Text(
          cardSubTitle,
          style: subTitleTheme,
        ),
      ));
}
