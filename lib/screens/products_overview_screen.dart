import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
        ),
        body: ProductsGrid());
  }
}
