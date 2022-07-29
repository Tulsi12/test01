import 'package:flutter/material.dart';
import 'package:myapp/dao/CartDAO.dart';
import 'package:myapp/model/products.dart';
import 'package:myapp/screens/detail/components/size_list.dart';
import 'package:myapp/screens/product_desc/components/add_to_cart.dart';
import 'package:myapp/screens/product_desc/components/product_desc_appbar.dart';
import 'package:myapp/screens/product_desc/components/products_info.dart';

class ProductDescScreen extends StatelessWidget {
  const ProductDescScreen(
      {Key? key, required this.product, required this.cartDao})
      : super(key: key);
  final Product product;
  final CartDAO cartDao;
  static String routeName = "/productDesc";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDescAppBar(product: product),
            ProductInfo(product: product),
            SizeList(),
            AddToCart(
              product: product,
              cartDao: cartDao,
            )
          ],
        ),
      ),
    );
  }
}
