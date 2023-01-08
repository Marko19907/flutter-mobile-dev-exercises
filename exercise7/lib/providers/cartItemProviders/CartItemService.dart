import 'package:exercise_e7/model/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State storage for CartItem(s), with modification actions
class CartItemService extends StateNotifier<List<CartItem>> {
  // We can "inject" other services into the notifier object
  // This will be done in the Provider object which creates this notifier
  CartItemService([List<CartItem>? initialData]) : super(initialData ?? []);

  /// Refresh all "from the database"
  void refreshAll() {
    state = [...state];
  }

  List<CartItem> getAll() {
    return List.of(state);
  }

  int getProductCount() {
    return state.map((item) => item.count)
        .reduce((value, element) => value += element);
  }

  /// Remove the last book from the list
  void remove(int id) {
    final List<CartItem> newState = state;
    newState.removeWhere((element) => element.id == id);
    state = [...newState];
  }

  /// Add a random book to the list
  void add(CartItem item) {
    state = [...state, item];
  }
}
