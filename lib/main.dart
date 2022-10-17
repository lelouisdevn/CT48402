import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
// import 'package:myshop/ui/cart/cart_screen.dart';
// import 'package:myshop/ui/orders/orders_screen.dart';
// import 'package:myshop/ui/products/user_products_screen.dart';
// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/products_manager.dart';
// import 'ui/products/product_overview_screen.dart';
// import 'ui/products/user_products_screen.dart';
// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';
import 'package:provider/provider.dart';

import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false, //bỏ chữ Debug ở góc phải màn hình
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        // home: SafeArea(child: ProductDetailScreen(ProductManager().items[0])),
        // home: const SafeArea(child: ProductsOverviewScreen()),
        // home: const SafeArea(child: UserProductsScreen())
        // home: const SafeArea(
        // child: CartScreen()
        // child: OrdersScreen(),
        // ),

        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(builder: (context) {
              return ProductDetailScreen(
                context.read<ProductManager>().findById(productId),
              );
            });
          }
          return null;
        },
      ),
    );
  }
}
