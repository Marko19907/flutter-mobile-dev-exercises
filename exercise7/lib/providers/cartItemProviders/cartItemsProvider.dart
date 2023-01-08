import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/cart_item.dart';
import 'CartItemService.dart';

final cartItemsProvider = StateNotifierProvider<CartItemService, List<CartItem>>((ref) {
  return CartItemService();
});
