import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/products_admin.dart';
import './pages/auth.dart';
import './pages/product.dart';
import './pages/products.dart';
import './models/product.dart';

main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Product newProduct) {
    setState(() {
      _products[index] = newProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/admin': (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct, _updateProduct, _products),
        '/products': (BuildContext context) =>
            ProductsPage(_products)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          String title = _products[index].title;
          String imageUrl = _products[index].imageUrl;
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(title, imageUrl));
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products));
      },
    );
  }
}
