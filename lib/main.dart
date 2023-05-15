import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/app/app_view.dart';
import 'package:qoute_app/helpers/bloc_observer.dart';
import 'package:qoute_app/view/shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// quản lý các bloc trong app
  Bloc.observer = AppBlocObserver();
  /// Preferences /// lưu data local
  SharedPreferencesImp sharedPreferencesImp = SharedPreferencesImp();
  await sharedPreferencesImp.initPreferences();

  runApp(MyApp());
}