// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:demo_tyba_andres_garcia/src/app.dart';
import 'package:demo_tyba_andres_garcia/src/config/config.dart';
import 'package:demo_tyba_andres_garcia/src/infrastructure/infrastructure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a Title of "Lindenwood University"',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());

      await settingsController.loadSettings();
      // Define a Widget
      MyApp myWidget = MyApp(
        settingsController: settingsController,
        universityConfig: UniversityConfig(UniversityMockApi()),
      );

      // Build myWidget and trigger a frame.
      await tester.pumpWidget(myWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify myWidget shows some text
      expect(find.text('Lindenwood University'), findsOneWidget);
    });
  });
}
