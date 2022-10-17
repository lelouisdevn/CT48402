import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/products/top_right_badge.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';
import 'products_grid.dart';
import '../shared/app_drawer.dart';
import '../cart/cart_manager.dart';
import 'top_right_badge.dart';

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
        // lưới hiện sản phẩm
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    // return IconButton(
    //   icon: const Icon(Icons.shopping_cart),
    //   onPressed: () {
    //     // print('Go to cart screen');
    //     Navigator.of(context).pushNamed(CartScreen.routeName);
    //   },
    // );

    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          // data: CartManager().productCount,
          data: cartManager.productCount,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
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
