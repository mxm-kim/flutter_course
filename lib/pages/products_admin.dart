import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;

  ProductsAdminPage(this.addProduct);

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
              children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
            )));
  }
}
