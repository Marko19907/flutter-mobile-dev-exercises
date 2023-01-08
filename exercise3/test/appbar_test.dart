import 'package:e3_solution/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("AppBar is present", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());

    final Finder appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });

  testWidgets("AppBar has the right text", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());

    final Finder appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    final Finder appBarText =
    find.descendant(of: appBar, matching: find.text("E3 Solution"));
    expect(appBarText, findsOneWidget);
  });
}
