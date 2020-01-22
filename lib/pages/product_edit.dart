import 'dart:math';

import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final int productIndex;
  Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'imageUrl': 'assets/food.jpeg'
  };

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _makeNameTextGroup() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product title'),
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Title is required';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _makePriceTextGroup() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product price'),
      initialValue: widget.product == null ? '' : widget.product['price'].toString(),
      keyboardType: TextInputType.number,
      validator: (String value) {
        double doubleValue = double.parse(value);
        if (value.trim().isEmpty) {
          return 'Price is required';
        }

        if (doubleValue == null) {
          return 'Incorrect format';
        }

        return null;
      },
      onSaved: (String value) {
        double doubleValue = double.parse(value);
        if (doubleValue != null) {
          _formData['price'] = doubleValue;
        }
      },
    );
  }

  Widget _makeDescriptionTextGroup() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product description'),
      initialValue: widget.product == null ? '' : widget.product['description'],
      maxLines: 4,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  void _submitForm() {
    bool formValidated = _formKey.currentState.validate();

    if (!formValidated) {
      return;
    }
    _formKey.currentState.save();

    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }
    Navigator.popAndPushNamed(context, '/products');
  }

  EdgeInsets _calculatePadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double contentWidth = min(550, screenWidth * 0.95);

    double paddingValue = (screenWidth - contentWidth) / 2;

    return EdgeInsets.symmetric(horizontal: paddingValue);
  }

  Widget _makeContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Focus.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: _calculatePadding(context),
            children: <Widget>[
              _makeNameTextGroup(),
              _makePriceTextGroup(),
              _makeDescriptionTextGroup(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('Save'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product == null) {
      return _makeContent(context);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit product'),
        ),
        body: _makeContent(context),
      );
    }
  }
}
