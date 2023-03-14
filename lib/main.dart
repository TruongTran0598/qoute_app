import 'package:flutter/material.dart';
import 'package:qoute_app/common/common_colors/app_colors.dart';
import 'package:qoute_app/common/common_text_style/text_style.dart';
import 'package:qoute_app/shared_preferences/shared_preferences.dart';

import 'splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Preferences
  SharedPreferencesImp sharedPreferencesImp = SharedPreferencesImp();
  await sharedPreferencesImp.initPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.bgBottomNavigatorColor,
          elevation: 0,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unSelectColor,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.unSelectColor,
        )
      ),
      home: const SplashScreen(),
    );
  }
}