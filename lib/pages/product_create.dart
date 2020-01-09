import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleText = '';
  String _descriptionText = '';
  double _price = 0;

  Widget _makeNameTextGroup() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product title'),
      onChanged: (String value) {
        _titleText = value;
      },
    );
  }

  Widget _makePriceTextGroup() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        double doubleValue = double.parse(value);
        if (doubleValue != null) {
          _price = doubleValue;
        }
      },
    );
  }

  Widget _makeDescriptionTextGroup() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product description'),
      maxLines: 4,
      onChanged: (String value) {
        _descriptionText = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: ListView(children: <Widget>[
          _makeNameTextGroup(),
          _makePriceTextGroup(),
          _makeDescriptionTextGroup(),
          SizedBox(height: 10.0,),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleText,
                'description': _descriptionText,
                'price': _price,
                'imageUrl': 'assets/food.jpeg'
              };
              widget.addProduct(product);
              Navigator.popAndPushNamed(context, '/products');
            },
          )
        ]));
  }
}
