import 'package:descentcode/providers/Products.dart';
import 'package:descentcode/widget/product_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GridViewItem extends StatelessWidget {
  bool isFav;
  GridViewItem(this.isFav);
  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<Products>(context);
    final product = isFav? providerdata.favitems: providerdata.items;
    return GridView.builder(
      itemBuilder: (ctx, ind) => ChangeNotifierProvider.value(
        value:  product[ind],
        child: myItem(
          // product[ind].id,
          // product[ind].price,
          // product[ind].title,
          // product[ind].imageUrl,
        ),
      ),
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10),
    );
  }
}
