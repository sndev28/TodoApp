import "package:flutter/material.dart";
import "./todoapp.dart";
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}
