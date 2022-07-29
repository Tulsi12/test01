import 'package:badges/badges.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/appbar.dart';
import 'package:myapp/const/const.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/dao/CartDAO.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/entity/cart.dart';
import 'package:myapp/http/httpproducts.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/model/products.dart';
import 'package:myapp/screens/addproduct/addproduct_screen.dart';
import 'package:myapp/screens/cart/cart_screen.dart';
import 'package:myapp/screens/product/components/body.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.dao}) : super(key: key);
  static String routeName = "/productList";
  final CartDAO dao;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> products = List<ProductModel>.empty(growable: true);
  late Future<List<Product>> futureProduct;
  @override
  void initState() {
    super.initState();
    futureProduct = HttpConnectProduct().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // CartDAO dao = getDao() as CartDAO;
    return Scaffold(
      appBar:buildAppBar(context, "All products"),
      // backgroundColor: Colors.grey[200],
      body: Body(cartDAO: widget.dao),
      floatingActionButton: StreamBuilder(
        stream: widget.dao.getAllItemInCartByUid(UID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data as List<Cart>;
            return Badge(
              position: const BadgePosition(top: 0, end: 1),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.fade,
              showBadge: true,
              badgeColor: Colors.red,
              badgeContent: Text(
                '${list.length > 0 ? list.map<int>((m) => m.quantity).reduce((value, element) => value + element) : 0}',
                style: TextStyle(color: Colors.white),
              ),
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, "/mycart");
                },
                child:const Icon(
                  Icons.shopping_cart,
                ),
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }

 
}
