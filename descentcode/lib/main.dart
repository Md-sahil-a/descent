import 'package:descentcode/widget/product_detail.dart';
import 'package:flutter/material.dart';

import './screens//Product_overView_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Color.fromARGB(255, 8, 93, 162)),
      ),
      home: ProductOverView(),
      routes: {
        productDetail.routname:(context) => productDetail(),
      },
    );
  }
}
