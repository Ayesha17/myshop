import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)?.settings.arguments as String;
    //listen in provider false just not to listen when product is updated or dont build the widget
    final productDetail =
        Provider.of<Products>(context, listen: false).findById(productId);
    // final productDetail =
    //     products.items.firstWhere((element) => element.id == productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(productDetail.title),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              productDetail.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$${productDetail.price}',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),SizedBox(height: 10,),
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(10),
               child:  Text(productDetail.desc,textAlign: TextAlign.center,softWrap: true,),
             )
        ])));
  }
}
