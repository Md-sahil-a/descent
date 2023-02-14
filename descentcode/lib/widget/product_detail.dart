import 'package:flutter/material.dart';


class productDetail extends StatelessWidget {
  const productDetail({super.key});
  static const routname = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final argId  = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        children: [
          Text('welcome')
        ],
      ),
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}


