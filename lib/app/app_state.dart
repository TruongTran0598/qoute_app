part of 'app_cubit.dart';

class AppState extends BaseState<AppState> {
  final Locale locale;
  final ThemeMode themeMode;

  AppState({
    required this.locale,
    required this.themeMode,
  });

  static AppState init() => AppState(
        locale: const Locale('vi', 'VN'),
    themeMode: ThemeMode.light,
      );

  @override
  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) =>
      AppState(
        locale: locale ?? this.locale,
        themeMode: themeMode ?? this.themeMode,
      );
}
