import 'package:exercise_e2/animal.dart';
import 'package:test/test.dart';

void main() {
  test('Step 1 - Animal class', () {
    final a = Animal(name: "Crocodile", legCount: 4);
    expect(a.hasWings, false);
    expect(a.name, "Crocodile");
    expect(a.legCount, 4);
    expect(a.canFly(), false);
  });
}
