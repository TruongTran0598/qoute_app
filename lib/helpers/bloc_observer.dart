import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver{
  /// All bloc was init
  static final Map<Object, BlocBase> blocs = {};

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    blocs[bloc.runtimeType] = bloc;
    debugPrint('BlocCreate - ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('BlocCreate - ${bloc.runtimeType} - event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('BlocChange - ${bloc.runtimeType} - nextState = $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('BlocTransition - ${bloc.runtimeType} - nextState = $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('BlocError - ${bloc.runtimeType} - nextState = $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    blocs.remove(bloc.runtimeType);
    debugPrint('BlocError - ${bloc.runtimeType}');
  }
}