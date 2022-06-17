import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) => Card(
            child: Text('s'),
          ),
          itemCount: orderData.order.length,
        ));
  }
}
