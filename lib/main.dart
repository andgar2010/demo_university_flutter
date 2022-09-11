import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/config/config.dart';
import 'src/infrastructure/infrastructure.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(
    AppConfig(
      appName: 'Demo University - Andres Garcia',
      apiAssetsBaseUrl: 'https://tyba-assets.s3.amazonaws.com',
      child: MyApp(
        settingsController: settingsController,
        universityConfig: UniversityConfig(UniversityApi()),
      ),
    ),
  );
}
