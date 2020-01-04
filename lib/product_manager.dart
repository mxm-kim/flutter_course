import 'package:flutter/material.dart';
import 'products.dart';

class ProductManager extends StatefulWidget {
  String startingProduct;

  ProductManager(this.startingProduct);

  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Product')),
      ),
      Products(_products)
    ]);
  }
}
