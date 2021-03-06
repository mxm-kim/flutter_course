import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Manage products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('EasyList'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: Products(products));
  }
}
