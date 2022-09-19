import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrdersManager with ChangeNotifier {
  final List _orders = [
    OrderItem(id: 'o1' ,amount: 59.98, products: [
      CartItem(id: 'c1', title: 'Red Shirt', quantity: 2, price: 29.99)
    ], dateTime: DateTime.now(),),
    OrderItem(id: 'o2' ,amount: 92.97, products: [
      CartItem(id: 'c1', title: 'Blue Trousers', quantity: 3, price: 30.99)
    ], dateTime: DateTime.now(),),
  ];

  int get orderCount {
    return _orders.length;
  }

  List get orders {
    return [..._orders];
  }

}