import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// check trạng thái hoạt động của app
class WidgetLifecycleHandler extends WidgetsBindingObserver {
  final AsyncCallback? resumedCallBack;
  final AsyncCallback? pausedCallBack;
  final AsyncCallback? detachedCallBack;
  final AsyncCallback? inactiveCallBack;

  WidgetLifecycleHandler({
    this.resumedCallBack,
    this.pausedCallBack,
    this.detachedCallBack,
    this.inactiveCallBack,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        await resumedCallBack?.call();
        break;
      case AppLifecycleState.paused:
        await pausedCallBack?.call();
        break;
      case AppLifecycleState.detached:
        await detachedCallBack?.call();
        break;
      case AppLifecycleState.inactive:
        await inactiveCallBack?.call();
        break;
    }
  }
}