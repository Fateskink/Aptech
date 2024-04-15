import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  static const String _cartKey = 'cartItems';

  Future<Map<int, int>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic>? cartItemsMap = prefs.getString(_cartKey) != null
        ? json.decode(prefs.getString(_cartKey)!) as Map<String, dynamic>
        : {};

    // Convert keys from String to int and values from dynamic to int
    Map<int, int> typedCartItemsMap = cartItemsMap.map((key, value) => MapEntry(int.parse(key), value as int));

    return typedCartItemsMap;
  }

  // Function to read number of product by product Id
  Future<int?> getProductCountById(int productId) async {
    Map<int, int> cartItemsMap = await getCart();
    return cartItemsMap[productId];
  }

  Future<void> saveCart(int productId, int itemCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Fetch existing cart items map from local storage
    Map<int, int> cartItemsMap = await getCart();
    // Update the item count for the given product ID
    cartItemsMap[productId] = itemCount;
    // Save the updated cart items map back to local storage
    prefs.setString(_cartKey, json.encode(cartItemsMap));
  }

  Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Remove cart items associated with _cartKey
    prefs.remove(_cartKey);
  }
}
