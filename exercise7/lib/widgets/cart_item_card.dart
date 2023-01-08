import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:exercise_e7/model/cart_item.dart';

import '../providers/cartItemProviders/cartItemsProvider.dart';

/// Creates a Card displaying a single shopping-cart item
class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/tshirt.jpg", height: 30),
              const SizedBox(width: 16),
              Text(
                "${item.count}x ${item.name}, size ${item.size}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 16),
              Consumer(builder: (context, ref, child) {
                return IconButton(
                  onPressed: () => _delete(ref),
                  icon: const Icon(Icons.delete),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _delete(WidgetRef ref) {
    final notifier = ref.read(cartItemsProvider.notifier);
    notifier.remove(item.id);
  }
}
