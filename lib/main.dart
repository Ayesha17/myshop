import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/screens/order_screen.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'screens/products_overview_screen.dart';

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
          ChangeNotifierProvider.value(value: Products()),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProvider.value(value: Orders()),
        ],
        // create: (ctx) => Products(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
              ).copyWith(secondary: Colors.brown.shade300),
              fontFamily: 'Regular'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrderScreen.routeName: (context) => OrderScreen(),
          },
        ));
  }
}
