import 'package:descentcode/providers/Products.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';


class productDetail extends StatelessWidget {
  const productDetail({super.key});
  static const routname = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final argId  = ModalRoute.of(context)!.settings.arguments as String;
    final prods = Provider.of<Products>(context).findbyid(argId);
    return Scaffold(
      body: Column(
        children: [
          Text('welcome')
        ],
      ),
      appBar: AppBar(
        title: Text(prods.title),
      ),
    );
  }
}


