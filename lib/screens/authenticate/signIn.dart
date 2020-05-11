import 'package:firebase_login_register/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        title: Text('Login to Lingkung'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Register')
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async{
                  print(email);
                  print(password);
                }
              )
            ],
          )
        ),

        // child: RaisedButton(
        //   child: Text('Login Anon'),
        //   onPressed: () async{
        //     dynamic result = await _auth.signInAnon();
        //     if (result == null) {
        //       print('error Login');
        //     }else{
        //       print('Loged In');
        //       print(result.uid);
        //     }
        //   },
        // )
      ),
    );
  }
}
