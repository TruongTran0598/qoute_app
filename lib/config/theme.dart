import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';

final lightThem = ThemeData(
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
  ),
);

final darkThem = ThemeData.dark().copyWith();
