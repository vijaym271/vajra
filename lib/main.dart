import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vajra/config/constants.dart';
import 'package:vajra/config/my_app_theme.dart';
import 'package:vajra/pages/landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.title,
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme(),
      home: const SafeArea(child: LandingPage()),
    );
  }
}
