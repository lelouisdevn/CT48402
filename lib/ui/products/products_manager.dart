import '../../models/product.dart';

class ProductManager {
  final List _items = [];

  int get itemCount {
    return _items.length;
  }

  List get items {
    return [..._items];
  }

  List get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
}