import 'package:descentcode/providers/Products.dart';
import 'package:descentcode/providers/product.dart';
import 'package:descentcode/widget/app_drawer.dart';
import 'package:descentcode/widget/edit_inner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderEdit extends StatelessWidget {
  const OrderEdit({super.key});
  static const routName = '/Order-Edit';
  @override
  Widget build(BuildContext context) {
   final productData = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Welcome'),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.add),),
      ],
      ),
      body: ListView.builder(itemBuilder: (_, index) => EditPage(title: productData.items[index].title, imageUrl: productData.items[index].imageUrl),
      itemCount: productData.items.length ,
    ));
  }
}