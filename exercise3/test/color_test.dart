import 'package:e3_solution/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Grey background color", (tester) async {
    await tester.pumpWidget(const E3SolutionApp());
    final firstContainer =
        tester.firstWidget(find.byType(Container)) as Container;
    expect(firstContainer, isNotNull);
    expect(firstContainer.color, equals(Colors.grey[200]));
  });
}
