import 'package:flutter/material.dart';
import 'package:myapp/components/appbar.dart';
import 'package:myapp/components/default_button.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/dao/CartDAO.dart';
import 'package:myapp/model/cartmodel.dart';
import 'package:myapp/pallate.dart';
import 'package:myapp/screens/cart/components/body.dart';
import 'package:myapp/screens/home/home_screen.dart';
import 'package:myapp/size_config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required this.dao}) : super(key: key);
  static String routeName = '/mycart';
  final CartDAO dao;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Your Cart"),
      body: Body(cartDao: dao),
    
    );
  }

  AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    foregroundColor: Theme.of(context).accentColor,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.white,
    title: Column(
      children: [
        Text(title),
      ],
    ),
  );
}


}

