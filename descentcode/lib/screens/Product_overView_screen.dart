// ignore: file_names
import 'package:descentcode/providers/product.dart';
import 'package:descentcode/widget/gridView.dart';
import 'package:descentcode/widget/product_item.dart';
import 'package:flutter/material.dart';




  enum filterOptions {
  Fav,
  All,
  }


class ProductOverView extends StatefulWidget {
  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {

  var _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Descent Fashion"),
        actions: [
          PopupMenuButton(itemBuilder: 
          (_)=> [
            PopupMenuItem(child: Text('Fav'), value: filterOptions.Fav,),
            PopupMenuItem(child: Text('All'), value: filterOptions.All, ),
          ],
          icon: Icon(Icons.more_vert),
          onSelected: (selectedValue){
            print(selectedValue);
            setState(() {
              if(selectedValue == filterOptions.Fav){
                _showFav = true;
              }else{
                _showFav = false;
              }
            });
          },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          child: GridViewItem(_showFav),
        ),
      ),
    );
  }
}

