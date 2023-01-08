import 'package:e3_solution/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Button font size", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Finder allButtons = find.byType(ElevatedButton);
    final buttonCount = allButtons.evaluate().length;

    for (int i = 0; i < buttonCount; ++i) {
      final Finder textFinder = find.descendant(
        of: allButtons.at(i),
        matching: find.byType(Text),
      );
      final Text text = tester.element(textFinder).widget as Text;
      expect(text, isNotNull);
      expect(text.style, isNotNull);
      expect(text.style!.fontSize, moreOrLessEquals(16));
    }
  });
  testWidgets("First button is bold", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Finder firstButton = find.byType(ElevatedButton).first;
    expect(firstButton, findsOneWidget);
    final Finder textFinder =
        find.descendant(of: firstButton, matching: find.byType(Text));
    expect(textFinder, findsOneWidget);
    final Text text = tester.element(textFinder).widget as Text;
    expect(text, isNotNull);
    expect(text.style, isNotNull);
    expect(text.style!.fontWeight, equals(FontWeight.bold));
  });
}
