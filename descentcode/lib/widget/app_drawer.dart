import 'package:descentcode/screens/order_edit_page.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      
        child: Column(
          children: [
            AppBar(
              title:const Text('settings'),
            ),
            ListTile(
              title: const Text('your order page'),
              trailing: IconButton(icon:const Icon(Icons.edit), onPressed: () {
                Navigator.pushReplacementNamed(context, OrderEdit.routName);
               },)
            ),
            ListTile(
              title: const Text('your order page'),
              trailing: IconButton(icon:const Icon(Icons.home), onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
               },)
            ),
          ],
        ),
    );
  }
}