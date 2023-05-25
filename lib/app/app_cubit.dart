import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/app/base/state_base.dart';
import 'package:qoute_app/config/theme.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.init());

  void switchLanguage(String language) {
    emit(state.copyWith(locale: Locale(language)));
  }
}
