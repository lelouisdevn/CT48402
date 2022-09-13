import 'package:flutter/material.dart';
import 'products_grid.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildProductFilterMenu() {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        print('Go to cart screen');
      },
    );
  }

  Widget buildShoppingCartIcon() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Only favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show all'),
        ),
      ],
    );
  }
}
