import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/pallate.dart';
import 'package:myapp/screens/product/product_list_screen.dart';
import 'package:myapp/size_config.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, ProductList.routeName);
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                        color: kBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  width:getProportionateScreenHeight(context, 5),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBlue),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
