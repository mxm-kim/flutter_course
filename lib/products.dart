import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print("[Products Widget] constructor");
  }

  Widget _buildProductItem(context, index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpeg'),
          Text(products[index]),
        ],
      ),
    );
  }

  Widget _makeListBuilder() {
    return ListView.builder(
      itemBuilder: _buildProductItem,
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
