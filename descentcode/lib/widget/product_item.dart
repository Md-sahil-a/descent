import 'package:descentcode/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

import './product_detail.dart';

class myItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;
  // myItem(this.id, this.price, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final producd = Provider.of<Product>(context);
    final cartItem = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            productDetail.routname,
            arguments: producd.id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              producd.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon:
                  Icon(producd.isFav ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                producd.changefav();
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cartItem.addProduct(producd.id, producd.title, producd.price);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("Item added"),
                    action: SnackBarAction(label: 'undo', onPressed: () {
                    },),
                     ),
                );
              },
            ),
          ),
          child: Image.network(
            producd.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
