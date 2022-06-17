import 'package:flutter/foundation.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  late Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + (cartItem.price * cartItem.quantity);
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existingItem) => CartItems(existingItem.id, existingItem.title,
              existingItem.quantity + 1, existingItem.price));
    } else {
      //new entry
      _items.putIfAbsent(productId,
          () => CartItems(DateTime.now().toString(), title, 1, price));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
