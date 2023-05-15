import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/app/base/state_base.dart';

abstract class BaseBloc<T extends BaseState> extends Cubit<T>{
  BaseBloc(super.initialState);
}