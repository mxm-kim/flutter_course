import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> product = products[index];
        String title = product['title'];
        String imageUrl = product['imageUrl'];

        return ListTile(
          leading: Image.asset(imageUrl),
          title: Text(title),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProductEditPage(
                      product: product,
                      updateProduct: updateProduct,
                      productIndex: index,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
