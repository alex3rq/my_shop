import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilteredOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: [
            Consumer<Cart>(
              builder: (_, cart, __) {
                return Badge(
                  badgeContent: Text(
                    cart.itemCount > 0 ? cart.itemCount.toString() : "",
                    style: TextStyle(color: Colors.white),
                  ),
                  position: BadgePosition.topEnd(top: 1, end: 1),
                  badgeColor: Theme.of(context).accentColor,
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                );
              },
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilteredOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilteredOptions.All,
                ),
              ],
              onSelected: (FilteredOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilteredOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
            ),
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
