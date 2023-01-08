import 'package:exercise_e4/app.dart';
import 'package:exercise_e4/app_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Tap on sign-out", (tester) async {
    const app = E4App();
    await tester.pumpWidget(app);
    final signOutButton = find.byType(IconButton);
    expect(signOutButton, findsOneWidget);
    // Was not signed out first, then is signed out after clicking the button
    expect(AppLogic.instance().isSignedOut, isFalse);
    await tester.tap(signOutButton);
    expect(AppLogic.instance().isSignedOut, isTrue);
  });

  testWidgets("Tap on picture change", (tester) async {
    const app = E4App();
    await tester.pumpWidget(app);
    final changePictureButton = find.byType(ElevatedButton);
    expect(changePictureButton, findsOneWidget);
    expect(AppLogic.instance().isPictureChanged, isFalse);
    await tester.tap(changePictureButton);
    expect(AppLogic.instance().isPictureChanged, isTrue);
  });

  testWidgets("Tap on help", (tester) async {
    const app = E4App();
    await tester.pumpWidget(app);
    final helpButton = find.byType(FloatingActionButton);
    expect(helpButton, findsOneWidget);
    expect(AppLogic.instance().isHelpShown, isFalse);
    await tester.tap(helpButton);
    expect(AppLogic.instance().isHelpShown, isTrue);
  });
}
