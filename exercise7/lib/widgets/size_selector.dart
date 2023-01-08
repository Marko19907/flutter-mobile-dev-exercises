import 'package:exercise_e7/providers/sizeProvider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget for selecting styles
/// Calls the onSelected callback when a new size is selected
/// Note: this must be a StatefulWidget, otherwise the DropdownButton
/// value can't be updated
class SizeSelector extends StatefulWidget {
  const SizeSelector({Key? key}) : super(key: key);

  static const Key selectorKey = Key("size_selector");

  @override
  State<SizeSelector> createState() => _SizeSelectorState();

  // Special constant which is not really a size
  static const noSize = "Select size";

  // Allowed sizes
  static const sizes = [noSize, "S", "M", "L", "XL"];
}

class _SizeSelectorState extends State<SizeSelector> {
  String? selectedValue = SizeSelector.noSize;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return DropdownButton<String>(
        key: SizeSelector.selectorKey,
        items: SizeSelector.sizes
            .map((size) => DropdownMenuItem(value: size, child: Text(size)))
            .toList(),
        onChanged: (size) => _sizeSelected(size!, ref),
        value: selectedValue,
      );
    });
  }

  /// This method is called when a new value is selected
  /// call the `onSelected` callback if the selected value is not the "title"
  void _sizeSelected(String size, WidgetRef ref) {
    ref.read(sizeProvider.notifier).state = size;
    setState(() {
      selectedValue = size;
    });
  }
}
