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
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(product),));
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
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
      leading: ValueListenableBuilder<bool>(
          valueListenable: product.isFavoriteListenable,
          builder: (ctx, isFavorite, child) {
            return IconButton(
              icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                // print('Toggle a favorite product');
                product.isFavorite = !isFavorite;
              },
            );
          }),
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
