import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/app.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/service_locator.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/shared_pref.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = AppPreferences();
  await prefs.init();

  runApp(const MyApp());
}
