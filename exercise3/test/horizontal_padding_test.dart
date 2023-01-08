import 'package:e3_solution/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Horizontal padding", (tester) async {
    final Key appKey = UniqueKey();
    await tester.pumpWidget(E3SolutionApp(key: appKey));
    RenderBox appBox = tester.renderObject(find.byKey(appKey));
    final double appBoxWidth = appBox.size.width;

    final Finder allButtons = find.byType(ElevatedButton);
    expect(allButtons, findsWidgets);
    final int buttonCount = allButtons.evaluate().length;
    for (int i = 0; i < buttonCount; ++i) {
      RenderBox buttonBox = tester.renderObject(allButtons.at(i));
      expect(buttonBox.size.width, moreOrLessEquals(appBoxWidth - 100));
    }
  });
}
