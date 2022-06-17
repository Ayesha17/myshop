import 'package:flutter/cupertino.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get order {
    return [..._orders];
  }

  void addOrders(double amount, List<CartItems> products) {
    _orders.insert(0,
        OrderItem(DateTime.now().toString(), amount, products, DateTime.now()));
    notifyListeners();
  }
}
