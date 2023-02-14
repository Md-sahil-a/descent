import 'package:flutter/material.dart';

import '../models/products.dart';

import './product_detail.dart';

class myItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  myItem(this.id, this.price, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(
          productDetail.routname,
            arguments: id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(title,
            textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            trailing: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: (){},),
          ),
          child:  Image.network(imageUrl,
          fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
