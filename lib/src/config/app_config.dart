import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    required this.appName,
    required this.apiAssetsBaseUrl,
    required Widget child,
    super.key,
  }) : super(child: child);

  final String appName;
  final String apiAssetsBaseUrl;

  static AppConfig of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfig>()!;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
