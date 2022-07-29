import 'package:flutter/material.dart';
import 'package:myapp/pallate.dart';

class SearchInput extends StatelessWidget {
  final tagList = ["Women", "Men", "Unisex"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: "Search....",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/icons/search.png",
                        width: 20,
                      ),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/icons/filter.png",
                width: 25,
              ),
            )
          ],
        ),
        Row(
            children: tagList
                .map((e) => Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor),
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList())
      ]),
    );
  }
}
