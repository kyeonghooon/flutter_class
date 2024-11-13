import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/mvvm/view/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/mvvm/view/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/mvvm/view_models/item_view_model.dart';
import 'package:flutter_shoppingcart/theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<ItemViewModel>(
      create: (_) => ItemViewModel(),
      child: MaterialApp(
        theme: theme(),
        home: SafeArea(
          child: ShoppingCartPage(),
        ),
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingcartHeader(),
          Expanded(child: ShoppingcartDetail()),
        ],
      ),
    );
  }

  // private 메서드 만들어 보기

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
