import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct}) {
    print("[Products Widget] constructor");
  }

  Widget _buildProductItem(context, index) {
    String title = products[index]['title'];
    String imageUrl = products[index]['imageUrl'];
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl),
          Text(title),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.pushNamed<bool>(
                              context, '/product/' + index.toString())
                          .then((value) {
                        print(value);
                        if (value) {
                          deleteProduct(index);
                        }
                      })),
            ],
          )
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
