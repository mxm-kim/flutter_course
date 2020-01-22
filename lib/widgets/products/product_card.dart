import 'package:flutter/material.dart';

import '../ui_elements/title_default.dart';
import './price_tag.dart';
import '../../models/product.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard(this.product, {this.index});

  @override
  Widget build(BuildContext context) {
    String title = product.title;
    String imageUrl = product.imageUrl;
    String price = product.price.toString();

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(title),
                  SizedBox(
                    width: 15.0,
                  ),
                  PriceTag(price),
                ],
              )),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              child: Text('Red square, Moscow'),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString())),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}