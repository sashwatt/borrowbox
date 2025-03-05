import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItemToCart(Map<String, dynamic> gadget) {
    _cartItems.add(gadget);
    notifyListeners(); // Notify listeners that the cart has been updated
  }
}
