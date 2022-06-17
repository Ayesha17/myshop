import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/screens/order_screen.dart';
import 'package:myshop/widgets/cart_item.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .titleLarge
                                ?.color),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    TextButton(
                        onPressed: () {
                          Provider.of<Orders>(context,listen: false).addOrders(cart.totalAmount, cart.items.values.toList());
                          cart.clear();

                        },
                        child: Text('ORDER NOW'))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                  cart.items.values.toList()[index],
                  cart.items.keys.toList()[index]),
              itemCount: cart.items.length,
            ))
          ],
        ));
  }
}
