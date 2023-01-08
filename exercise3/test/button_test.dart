import 'package:e3_solution/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Three buttons present", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final buttons = find.byType(ElevatedButton);
    expect(buttons, findsNWidgets(3));
  });

  testWidgets("Vertical button layout", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Column column = tester.element(find.byType(Column)).widget as Column;
    final columnItems = column.children;
    expect(columnItems.length, equals(6));
    final firstButton = columnItems[1];
    final secondButton = columnItems[3];
    final thirdButton = columnItems[5];
    expect(firstButton, isInstanceOf<ElevatedButton>());
    expect(secondButton, isInstanceOf<ElevatedButton>());
    expect(thirdButton, isInstanceOf<ElevatedButton>());
  });

  testWidgets("Spacing between AppBard and first button", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Column column = tester.element(find.byType(Column)).widget as Column;
    final columnItems = column.children;
    expect(columnItems.length, equals(6));
    final Widget firstItem = columnItems.first;
    expect(firstItem, isInstanceOf<SizedBox>());
    final SizedBox sizedBox = firstItem as SizedBox;
    expect(sizedBox.height, moreOrLessEquals(32));
  });

  testWidgets("Spacing between buttons", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Column column = tester.element(find.byType(Column)).widget as Column;
    final columnItems = column.children;
    expect(columnItems.length, equals(6));
    final Widget firstSpace = columnItems[2];
    expect(firstSpace, isInstanceOf<SizedBox>());
    final SizedBox firstSizedBox = firstSpace as SizedBox;
    expect(firstSizedBox.height, moreOrLessEquals(16));
    final Widget secondSpace = columnItems[4];
    expect(secondSpace, isInstanceOf<SizedBox>());
    final SizedBox secondSizedBox = secondSpace as SizedBox;
    expect(secondSizedBox.height, moreOrLessEquals(16));
  });

  testWidgets("Student on the first button", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Finder studentButtonText = find.textContaining("Student");
    expect(studentButtonText, findsOneWidget);

    final ElevatedButton? buttonWithText = tester
        .element(studentButtonText)
        .findAncestorWidgetOfExactType<ElevatedButton>();
    expect(buttonWithText, isNotNull);
    final Finder firstButtonFinder = find.byType(ElevatedButton).first;
    expect(firstButtonFinder, findsOneWidget);
    final ElevatedButton firstButton =
        tester.element(firstButtonFinder).widget as ElevatedButton;
    expect(buttonWithText, equals(firstButton));
  });

  testWidgets("Chuck on the second button", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final Finder chuckButtonText = find.text("You don't disable Chuck Norris");
    expect(chuckButtonText, findsOneWidget);

    final ElevatedButton? buttonWithText = tester
        .element(chuckButtonText)
        .findAncestorWidgetOfExactType<ElevatedButton>();
    expect(buttonWithText, isNotNull);

    final Finder secondButtonFinder = find.byType(ElevatedButton).at(1);
    expect(secondButtonFinder, findsOneWidget);
    final ElevatedButton secondButton =
        tester.element(secondButtonFinder).widget as ElevatedButton;
    expect(buttonWithText, equals(secondButton));
  });

  testWidgets("Knock Knock, you are out", (tester) async {
    // Well, the name of this test is not that descriptive, is it? :)
    await tester.pumpWidget(const E3SolutionApp());
    final Finder disabledText = find.text("Chuck disables you");
    expect(disabledText, findsOneWidget);

    final ElevatedButton? buttonWithText = tester
        .element(disabledText)
        .findAncestorWidgetOfExactType<ElevatedButton>();
    expect(buttonWithText, isNotNull);

    final Finder thirdButtonFinder = find.byType(ElevatedButton).at(2);
    expect(thirdButtonFinder, findsOneWidget);
    final ElevatedButton thirdButton =
        tester.element(thirdButtonFinder).widget as ElevatedButton;
    expect(buttonWithText, equals(thirdButton));
  });

  testWidgets("First button is enabled", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());

    final Finder firstButtonFinder = find.byType(ElevatedButton).at(0);
    expect(firstButtonFinder, findsOneWidget);
    final ElevatedButton firstButton =
        tester.element(firstButtonFinder).widget as ElevatedButton;
    expect(firstButton.enabled, isTrue);
  });

  testWidgets("Second button is enabled", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());

    final Finder secondButtonFinder = find.byType(ElevatedButton).at(0);
    expect(secondButtonFinder, findsOneWidget);
    final ElevatedButton secondButton =
        tester.element(secondButtonFinder).widget as ElevatedButton;
    expect(secondButton.enabled, isTrue);
  });

  testWidgets("Third button is disabled", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());

    final Finder thirdButtonFinder = find.byType(ElevatedButton).at(2);
    expect(thirdButtonFinder, findsOneWidget);
    final ElevatedButton thirdButton =
        tester.element(thirdButtonFinder).widget as ElevatedButton;
    expect(thirdButton.enabled, isFalse);
  });
}
