import 'package:flutter/material.dart';
import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct}) {
    print('[ProductManager] constructor');
  }

  State<StatefulWidget> createState() {
    print('[ProductManager] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  void initState() {
    print('[_ProductManagerState] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void didUpdateWidget(ProductManager oldWidget) {
    print('[_ProductManagerState] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }

  Widget build(BuildContext context) {
    print('[_ProductManagerState] build()');
    return Column(children: [
      ProductControl(_addProduct),
      Expanded(child: Products(_products))
    ]);
  }
}
