import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/app.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/injection_container.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/shared_pref.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  initAppConfig();

  runApp(const MyApp());
}

Future<void> initAppConfig() async {
  final prefs = AppPreferences();
  await prefs.init();
}
