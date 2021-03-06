import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        title: 'Red Shirt',
        desc: 'A red Shirt - its a pretty red',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'),
    Product(
      id: 'p2',
      title: 'Trousers',
      desc: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      desc: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      desc: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // var _showFavoriteOnly = false;

  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get FavoriteItems{
    return  _items.where((element) => element.isFavorite).toList();
  }
  // void showFavoriteOnly(){
  //   _showFavoriteOnly=true;
  //   notifyListeners();
  // }
  //
  // void showAll(){
  //   _showFavoriteOnly=false;
  //   notifyListeners();
  // }

  Product findById(String productId) {
    return _items.firstWhere((element) => element.id == productId);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
