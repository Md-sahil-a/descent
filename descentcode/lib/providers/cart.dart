import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier{
 late Map<String, CartItem> _items = {};
  Map<String, CartItem> get item{
    return {..._items};
  }

   int  get itemLength{
    return _items.length;
   }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
  void addProduct(String productId, String title, int price){
    if(_items.containsKey(productId)){
      //..increase the quantity;
      _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, title: existingCartItem.title, quantity: existingCartItem.quantity +1, price: existingCartItem.price),);
    }else{
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }
}