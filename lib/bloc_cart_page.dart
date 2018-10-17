import 'package:flutter/material.dart';
import 'package:streambuilder/models/cart_item.dart';
import 'package:streambuilder/widgets/cart_page.dart';
import 'cart_provider.dart';

class BlocCartPage extends StatelessWidget {
  BlocCartPage();

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Cart"),
        ),
        body: StreamBuilder<List<CartItem>>(
            stream: cart.items,
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Center(
                    child: Text('Empty',
                        style: Theme.of(context).textTheme.display1));
              }

              return ListView(
                  children: snapshot.data
                      .map((item) => ItemTile(item: item))
                      .toList());
            }));
  }
}
