import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qoute_app/common/common_colors/app_colors.dart';
import 'package:qoute_app/common/common_images/image_assets.dart';
import 'package:qoute_app/common/common_text_style/text_style.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/login_screen/login_screen.dart';
import 'package:qoute_app/main_page/main_app_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: k08Size),
              child: Hero(
                tag: "primary_image",
                child: Image.asset(AppImageAssets.imageAppPrimary, height: 100),
              ),
            ),
            const Text("Status for you!", style: AppTextStyle.cara24White)
          ],
        ),
      ),
    );
  }
}
