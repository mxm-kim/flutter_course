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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Authentication'),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage('assets/background.jpg'))),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      filled: true,
                      fillColor: Colors.white),
                  onChanged: (String value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white),
                      obscureText: true,
                  onChanged: (String value) {
                    _password = value;
                  },
                ),
                SwitchListTile(
                  title: Text('Accept terms of agreements'),
                  value: _termsAgreed,
                  onChanged: (bool value) {
                    setState(() {
                      _termsAgreed = value;
                    });
                  },
                ),
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
            )))));
  }
}
