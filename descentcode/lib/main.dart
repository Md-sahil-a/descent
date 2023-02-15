import 'package:descentcode/providers/Products.dart';
import 'package:descentcode/providers/cart.dart';
import 'package:descentcode/screens/cart_screen.dart';
import 'package:descentcode/widget/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens//Product_overView_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Color.fromARGB(255, 235, 31, 8)),
        ),
        home: ProductOverView(),
        routes: {
          productDetail.routname: (context) => productDetail(),
          CartScreen.routeName: (context)=> CartScreen(),
        },
      ),
    );
  }
}
