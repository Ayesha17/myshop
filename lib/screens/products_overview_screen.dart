import 'package:flutter/material.dart';
import 'package:myshop/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import 'cart_screen.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cart, child) =>
                Badge(child as Widget, cart.itemCount.toString()),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductsGrid(_showFavoriteOnly),
    );
  }
}
