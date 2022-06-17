import 'package:flutter/cupertino.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.FavoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        // create: (ctx) => products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2),
    );
  }
}
