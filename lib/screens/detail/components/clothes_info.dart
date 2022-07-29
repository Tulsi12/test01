import 'package:flutter/material.dart';
import 'package:myapp/model/clothes.dart';

class ClothesInfo extends StatelessWidget {
  final Clothes clothes;
  const ClothesInfo({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${clothes.title} ${clothes.subtitle}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '4.5 (2.5k)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          RichText(
              text: TextSpan(children: [
    TextSpan(
                text:
                    'Gucci oversized hoodie, placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is',
                style: TextStyle(color: Colors.grey.withOpacity(0.7), height: 1.5)),
            TextSpan(
                text: ' Read More',
                style: TextStyle(color: Theme.of(context).primaryColor))
          ]))
        ],
      ),
    );
  }
}
