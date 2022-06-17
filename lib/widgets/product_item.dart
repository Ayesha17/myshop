import 'package:flutter/material.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final Product product;
  //
  // ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart =Provider.of<Cart>(context,listen: false);
    //consumer not rebuild the whole widget like the provider ... it just listen the changes
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              //child is the constant part which never change by any change in product
              builder: (ctx, product, child) => IconButton(
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              //this child is constant and never affect by the changes in product... and is used in item which we want not to build
              //     like
              //    label: child
              child: Text('test'),
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.title, product.price) ;
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ));
  }
}
