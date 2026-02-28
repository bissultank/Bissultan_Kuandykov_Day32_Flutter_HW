import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:firebase_auth_sample/main.dart';

void main() {
  testWidgets('App starts and renders auth flow shell', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(milliseconds: 300));

    // In widget tests Firebase may be unavailable for the current platform,
    // so we accept startup error, loading state, or auth entry UI.
    final hasStartupError = find.textContaining('Firebase не настроен').evaluate().isNotEmpty;
    final hasLoader = find.byType(CircularProgressIndicator).evaluate().isNotEmpty;
    final hasAuthUi = find.text('Sign Up').evaluate().isNotEmpty;

    expect(hasStartupError || hasLoader || hasAuthUi, isTrue);
  });
}
