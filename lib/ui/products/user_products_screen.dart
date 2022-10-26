import 'package:flutter/material.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import 'user_product_list_tile.dart';
import 'products_manager.dart';
import '../shared/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsManager = ProductManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      // body: RefreshIndicator(
      //   onRefresh: () async => print('refresh products'),
      //   child: buildUserProductListView(productsManager),
      // ),
      body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              child: buildUserProductListView(),
              onRefresh: () => _refreshProducts(context),
            );
          }),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductManager>(
      builder: (context, productManager, child) {
        return ListView.builder(
          itemCount: productManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductListTile(
                productManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        // print('Go to edit product screen');
        Navigator.of(context).pushNamed(EditProductScreen.routeName);
      },
    );
  }
}
