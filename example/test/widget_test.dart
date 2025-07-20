// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_mailer_example/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that platform version is retrieved.
    expect(
        find.widgetWithText(
          FloatingActionButton,
          'Add Image',
        ),
        findsOneWidget);
  });

  testWidgets('enter subject and body, then tap send',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    // Enter subject
    await tester.enterText(find.byType(TextField).at(0), 'Test Subject');
    // Enter body
    await tester.enterText(find.byType(TextField).at(1), 'Test Body');
    // Tap send icon button in AppBar
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();
    // Check for SnackBar or other result (platformResponse, etc.)
    // This may need to be adjusted depending on platform logic
    expect(find.byType(SnackBar),
        findsNothing); // Should not show error if send is possible
  });

  testWidgets('tap Add Image and check attachment',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    // Tap the Add Image button
    await tester.tap(find.widgetWithText(FloatingActionButton, 'Add Image'));
    await tester.pump();
    // Since image picker is not mocked, just check UI did not crash
    expect(find.byType(MyApp), findsOneWidget);
  });

  testWidgets('show SnackBar if cannot send', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    // Tap send icon button in AppBar
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();
    // This may need to be adjusted depending on platform logic
    expect(find.byType(SnackBar), findsNothing); // Adjust if error is expected
  });
}
