import 'package:firebase_login_register/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text('Lingkung'),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            label: Text('Logout'),
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
