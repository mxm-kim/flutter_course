import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProductHandler;

  ProductControl(this.addProductHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              addProductHandler({'title' : 'Exotic Product', 'imageUrl' : 'assets/food.jpeg'});
            },
            child: Text('Add Product')),
      );
  }
}