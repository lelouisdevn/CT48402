import 'package:flutter/material.dart';

import '../../models/product.dart';

import 'product_detail_screen.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
          child: GestureDetector(
        onTap: () {
          // print('Go to product detail screen');
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(product),));
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      )),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon:
            Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('Toggle a favorite product');
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
          onPressed: () {
            print('Add item to cart');
          },
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.shopping_cart)),
    );
  }
}