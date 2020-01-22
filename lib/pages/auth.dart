import 'dart:math';

import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email = '';
  String _password = '';
  bool _termsAgreed = false;

  DecorationImage _makeDecorationImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/background.jpg'));
  }

  Widget _makeLoginField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
      onChanged: (String value) {
        _email = value;
      },
    );
  }

  Widget _makePasswordField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        _password = value;
      },
    );
  }

  Widget _makeSwitchTile() {
    return SwitchListTile(
      title: Text('Accept terms of agreements'),
      value: _termsAgreed,
      onChanged: (bool value) {
        setState(() {
          _termsAgreed = value;
        });
      },
    );
  }

  double _calculateContentWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return min(screenWidth * 0.95, 550);
  }

  SingleChildScrollView _makeScrollableContent() {
    return SingleChildScrollView(
        child: Container(
            width: _calculateContentWidth(context),
            child: Column(
              children: <Widget>[
                _makeLoginField(),
                SizedBox(
                  height: 10.0,
                ),
                _makePasswordField(),
                _makeSwitchTile(),
                SizedBox(
                  height: 5.0,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('LOGIN'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Authentication'),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(image: _makeDecorationImage()),
            child: Center(child: _makeScrollableContent())));
  }
}
