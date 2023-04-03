import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/viewmodels/user_view_model.dart';
import 'package:flutter_boilerplate_mvvm_pattern/views/home.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => UserViewModel(),
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayOpacity: 0.4,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
