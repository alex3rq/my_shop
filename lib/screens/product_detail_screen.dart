import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // Select product id from passed argument.
    final productId = ModalRoute.of(context).settings.arguments as String;

    // Get product data from Products provider by id.
    final product =
        context.select((Products products) => products.findById(productId));

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Text(product.description),
      ),
    );
  }
}
