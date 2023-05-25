import 'package:flutter/cupertino.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> appNavKey =
      GlobalKey<NavigatorState>();

  static BuildContext getBuildContext = appNavKey.currentContext!;
}
