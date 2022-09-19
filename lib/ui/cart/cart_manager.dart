import '../../models/cart_item.dart';

class CartManager {
  final Map<String, CartItem> _items = {
    'p1': CartItem(id: 'c1', title: 'Red Shirt', price: 29.99, quantity: 2),
    'p2': CartItem(id: 'c2', title: 'Green dress', price: 50.99, quantity: 3),
  };

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
