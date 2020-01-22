import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/products/product_card.dart';
import './product_card.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct}) {
    print("[Products Widget] constructor");
  }

  Widget _makeListBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          ProductCard(products[index], index: index),
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build()");

    if (products.isEmpty) {
      return Center(
        child: Text('No product found, please add one'),
      );
    } else {
      return _makeListBuilder();
    }
  }
}
