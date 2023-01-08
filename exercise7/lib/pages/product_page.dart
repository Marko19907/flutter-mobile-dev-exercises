import 'package:exercise_e7/model/cart_item.dart';
import 'package:exercise_e7/providers/selectorCountProvider.dart';
import 'package:exercise_e7/providers/showSizeErrorProvider.dart';
import 'package:exercise_e7/providers/sizeProvider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/cartItemProviders/cartItemsProvider.dart';
import '../widgets/size_selector.dart';
import 'shopping_cart_page.dart';

/// Represents the product page
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);
  static const cartItemCountKey = Key("cart_item_count_text");
  static const addCountKey = Key("add_count_text");
  static const minusButtonKey = Key("minus_button");
  static const plusButtonKey = Key("plus_button");
  static const addToCartKey = Key("add_to_cart_button");
  static const openCartKey = Key("open_cart_button");
  static const String sizeErrorMessage = "Choose the size first";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product page"),
        actions: [_buildShoppingCartButton(context)],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildProductTitle(),
            _buildImage(),
            const SizeSelector(),
            _buildCountSelectors(),
            _buildButton(),
            _buildErrorMessage(context),
          ],
        ),
      ),
    );
  }

  /// Build the action-button to be shown in the action bar.
  /// On click it takes to the shopping-cart page
  Widget _buildShoppingCartButton(BuildContext context) {
    return Row(
      children: [
        _buildCartCounterText(),
        IconButton(
          key: openCartKey,
          onPressed: () => _showShoppingCartPage(context),
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  Widget _buildCartCounterText() {
    return Consumer(
      builder: (context, ref, child) {
        final List<CartItem> cartItems = ref.watch(cartItemsProvider);
        final notifier = ref.read(cartItemsProvider.notifier);

        if (cartItems.isEmpty) {
          return const Text("");
        }
        return Text(
          '${notifier.getProductCount()}',
          key: cartItemCountKey,
        );
      },
    );
  }

  /// Build the title for the product
  Widget _buildProductTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        "A nice t-shirt",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  /// Build the product image
  Widget _buildImage() {
    return Image.asset(
      "images/tshirt.jpg",
      height: 200,
    );
  }

  /// Build the row showing the temporary item count with + and - buttons to
  /// increment and decrement the count
  Widget _buildCountSelectors() {
    return Consumer(builder: (context, ref, child) {
      final count = ref.watch(selectorCountProvider);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              key: minusButtonKey,
              onPressed: count > 1 ? () => _decrementCount(ref) : null,
              icon: const Icon(Icons.remove),
            ),
            Text("Count: $count", key: addCountKey),
            IconButton(
              key: plusButtonKey,
              onPressed: count < 10 ? () => _incrementCount(ref) : null,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      );
    });
  }

  /// Build the "Add to cart" button
  Widget _buildButton() {
    return Consumer(builder: (context, ref, child) {
      return ElevatedButton(
        key: addToCartKey,
        onPressed: () => _addToCart(ref),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Add to cart"),
        ),
      );
    });
  }

  Widget _buildErrorMessage(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final showSizeError = ref.watch(showSizeErrorProvider);

      return showSizeError ? const Text(sizeErrorMessage) : const Text("");
    });
  }

  /// This method is called when the user presses on the "+" button -
  /// the count must be increased
  void _incrementCount(WidgetRef ref) {
    ref.read(selectorCountProvider.notifier).state++;
  }

  /// This method is called when the user presses on the "-" button -
  /// the count must be decreased
  void _decrementCount(WidgetRef ref) {
    ref.read(selectorCountProvider.notifier).state--;
  }

  /// This method is called when the user presses on the "Add to cart" button -
  /// a new item must be added to the cart, using the appropriate size and count
  void _addToCart(WidgetRef ref) {
    final service = ref.watch(cartItemsProvider);
    final size = ref.watch(sizeProvider);
    final count = ref.watch(selectorCountProvider);

    if (size == SizeSelector.noSize) {
      ref.read(showSizeErrorProvider.notifier).state = true;
      return;
    }
    ref.read(showSizeErrorProvider.notifier).state = false;

    service.add(CartItem.standard(size, count));

    final notifier = ref.read(cartItemsProvider.notifier);
    notifier.refreshAll();
  }

  /// Navigate to the shopping cart page
  void _showShoppingCartPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ShoppingCartPage(),
    ));
  }
}
