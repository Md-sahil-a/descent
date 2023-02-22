import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class cartInner extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final int price;
  final String productId;

  const cartInner(
      {super.key,
      required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: ((direction) => Provider.of<Cart>(context).removeItem(productId)),
      confirmDismiss: (direction){
        return showDialog(context: context, builder: ((ctx) => AlertDialog(
          actions: [
            TextButton(onPressed: (){
              Navigator.of(ctx).pop(true);
            }, child: const Text('Yes'),),
            TextButton(onPressed: (){
              Navigator.of(ctx).pop(false);
            }, child: const Text('No'),),
          ],
          title: const Text('Are you sure?'),
          content: const Text("if you chose yes than item will be deleted permanently"),
        ) ));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListTile(
            leading: CircleAvatar(child: Text('\$ $price')),
            trailing: Text('${quantity}x'),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
