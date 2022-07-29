import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/products.dart';
import 'package:myapp/screens/detail/components/colorpicker.dart';
import 'package:myapp/screens/product_desc/components/increase_item.dart';

class ProductDescAppBar extends StatefulWidget {
  const ProductDescAppBar({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDescAppBar> createState() => _ProductDescAppBarState();
}

class _ProductDescAppBarState extends State<ProductDescAppBar> {
  final List<Color> colors = const [
    Color(0xFFE6CFC6),
    Color(0xFFEEDFB5),
    Color(0xFFCAE2C5),
    Color(0XFFBAE6EE),
  ];
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;

  int _currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: NetworkImage("${widget.product.imageUrl}"),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30)),
                height: 175,
                width: 50,
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentColor = index;
                            });
                          },
                          child: ColorPicker(
                              color: colors[index],
                              outerBorder: _currentColor == index),
                        ),
                    separatorBuilder: (_, index) => const SizedBox(
                          height: 3,
                        ),
                    itemCount: colors.length),
              )),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      )),
                ),
                Container(
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 15,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
