import 'package:equatable/equatable.dart';
import 'package:qoute_app/utils/string.dart';

abstract class BaseState<T> extends Equatable {
  @override
  List<Object?> get props => [getRandomString(16)];

  T copyWith();
}