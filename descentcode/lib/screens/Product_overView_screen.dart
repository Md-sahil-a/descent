// ignore: file_names
import 'package:descentcode/providers/cart.dart';
import 'package:descentcode/providers/product.dart';
import 'package:descentcode/screens/cart_screen.dart';
import 'package:descentcode/widget/app_drawer.dart';
import 'package:descentcode/widget/badge.dart';
import 'package:descentcode/widget/gridView.dart';
import 'package:descentcode/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum filterOptions {
  Fav,
  All,
}

class ProductOverView extends StatefulWidget {
  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  var _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Descent Fashion"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Fav'),
                value: filterOptions.Fav,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: filterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.Fav) {
                  _showFav = true;
                } else {
                  _showFav = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            builder: ((context, cart, ch) => Badge(
                  color: Colors.red,
                  value: cart.itemLength.toString(),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          child: GridViewItem(_showFav),
        ),
      ),
    );
  }
}
