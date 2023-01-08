import 'package:hooks_riverpod/hooks_riverpod.dart';

final sizeProvider = StateProvider<String>((ref) {
  return "Select size";
});
