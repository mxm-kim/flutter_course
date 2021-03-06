import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';
import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;
  final List<Product> products;

  ProductsAdminPage(this.addProduct, this.deleteProduct, this.updateProduct, this.products);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                      automaticallyImplyLeading: false, title: Text('Choose')),
                  ListTile(
                    leading: Icon(Icons.shop),
                    title: Text('All products'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/products');
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('EasyList'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Create',
                    icon: Icon(Icons.create),
                  ),
                  Tab(
                    text: 'List',
                    icon: Icon(Icons.list),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[ProductEditPage(addProduct: addProduct), 
              ProductListPage(products, updateProduct, deleteProduct)],
            )));
  }
}
