import '../../models/cart_item.dart';
import 'package:flutter/foundation.dart';
import '../../models/product.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {
    'p1': CartItem(id: 'c1', title: 'Red Shirt', price: 29.99, quantity: 2),
    'p2': CartItem(id: 'c2', title: 'Green dress', price: 50.99, quantity: 3),
  };

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
            id: 'c${DateTime.now().toIso8601String()}',
            title: product.title,
            price: product.price,
            quantity: 1,),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) =>
            existingCartItem.copyWith(quantity: existingCartItem.quantity - 1),
      );
    }
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

// get the length of "array" _items;
  int get productCount {
    return _items.length;
  }

  List get products {
    return _items.values.toList(); //[c1, red shirt, 29.99, 2];
  }

  Iterable get productEntries {
    return {..._items}.entries;
  }

// tính tổng đơn hàng
  double get totalAmount {
    var total = 0.0;

    // lặp qua tất cả phần từ trong mảng items
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
