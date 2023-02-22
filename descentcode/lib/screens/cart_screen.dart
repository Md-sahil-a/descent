import 'package:descentcode/providers/cart.dart';
import 'package:descentcode/widget/cart_inner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartitem = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Your Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartitem.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('order Now'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => cartInner(
                  id: cartitem.item.values.toList()[i].id,
                  price: cartitem.item.values.toList()[i].price,
                  quantity: cartitem.item.values.toList()[i].quantity,
                  title: cartitem.item.values.toList()[i].title,
                  productId: cartitem.item.keys.toList()[i],
                  ),
              itemCount: cartitem.itemLength,
            ),
          ),
        ],
      ),
    );
  }
}
