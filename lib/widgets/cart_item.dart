import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final CartItems cartItem;
  final String productId;

  CartItem(this.cartItem,this.productId);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(cartItem.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          //check the direction if we have different option on swapping
          Provider.of<Cart>(context,listen: false).removeItem(productId);
        },
        background: Container(
          color: Theme.of(context).errorColor,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          padding: const EdgeInsets.only(right: 20),
        ),
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: CircleAvatar(
                    child: Padding(
                        padding:  const EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text(
                          '\$${cartItem.price}',
                          textAlign: TextAlign.center,
                          // style: TextStyle(fontSize: 10),
                        ))),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text('${cartItem.title}'),
                  subtitle: Text(
                    "Total:  \$${cartItem.price * cartItem.quantity}",
                    style: TextStyle(fontFamily: 'Regular', fontSize: 12),
                  ),
                  trailing: Text('${cartItem.quantity} x'),
                ))));
  }
}
