import 'package:flutter/material.dart';

class AppEnv extends InheritedWidget {
  AppEnv({
    required Widget child,
    required this.initRoute,
  }) : super(child: child);

  final String initRoute;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AppEnv? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppEnv>();
  }
}
