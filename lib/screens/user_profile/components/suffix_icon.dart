
import 'package:flutter/material.dart';
import 'package:myapp/size_config.dart';



class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.edit, color:Colors.green[500],
    size: getProportionateScreenWidth(context, 18),);
  }
}
