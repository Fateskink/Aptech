import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  static const String _cartKey = 'cartItems';

  Future<Map<String, int>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, int>? cartItemsMap = prefs.getString(_cartKey) != null
        ? Map<String, int>.from(json.decode(prefs.getString(_cartKey)!))
        : {};

    return cartItemsMap;
  }

  // Function to read number of product by product Id
  Future<int?> getProductCountById(int productId) async {
    Map<String, int> cartItemsMap = await getCart();
    return cartItemsMap[productId.toString()];
  }

  Future<void> saveCart(int productId, int itemCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Fetch existing cart items map from local storage
    Map<String, int> cartItemsMap = await getCart();

    // Update the item count for the given product ID
    cartItemsMap[productId.toString()] = itemCount;

    // Save the updated cart items map back to local storage
    prefs.setString(_cartKey, json.encode(cartItemsMap));
  }

  Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Remove cart items associated with _cartKey
    prefs.remove(_cartKey);
  }
}
