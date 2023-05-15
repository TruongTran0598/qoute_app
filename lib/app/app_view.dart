import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/app/app_cubit.dart';
import 'package:qoute_app/helpers/app_laguage.dart';
import 'package:qoute_app/helpers/widget_life_cycle.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';
import 'package:qoute_app/view/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    /// quản lý trang thái của app: fontground, background, terminate.
    WidgetsBinding.instance.addObserver(WidgetLifecycleHandler(
      resumedCallBack: resumedCallBack,
      pausedCallBack: pausedCallBack,
      detachedCallBack: detachedCallBack,
      inactiveCallBack: inactiveCallBack,
    ));
  }

  /// handle các trang thái nếu cần
  Future resumedCallBack() async {
    ///TODO: app resumed
  }

  Future pausedCallBack() async {
    ///TODO: app inactive
  }

  Future detachedCallBack() async {
    ///TODO: app paused
  }

  Future inactiveCallBack() async {
    ///TODO: app detached
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return BlocProvider<AppCubit>(
          create: (context) => AppCubit(), /// khởi tạo app cubit
          child: child,
        );
      },
      child: MaterialApp(
        title: 'quote app - truongtm1001',
        supportedLocales: AppLanguage.supportLanguages,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
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
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
