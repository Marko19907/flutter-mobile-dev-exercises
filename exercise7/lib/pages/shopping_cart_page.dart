import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/cartItemProviders/cartItemsProvider.dart';
import '../widgets/cart_item_card.dart';

/// Represents the "Shopping cart" page
class ShoppingCartPage extends StatelessWidget {

  const ShoppingCartPage({super.key});

  static const emptyCartMessage = "The cart is empty";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: _buildCartItems()
      ),
    );
  }

  /// Build a list of cards, displaying the items currently in the cart
  Widget _buildCartItems() {
    return Consumer(builder: (context, ref, child) {

      final service = ref.watch(cartItemsProvider);

      if (service.isEmpty) {
        return const Center(
          child: Text(ShoppingCartPage.emptyCartMessage),
        );
      }

      return Column(
        children: service.toList()
            .map((item) => CartItemCard(item))
            .toList(),
      );
    });
  }
}
