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
  final _formkey = GlobalKey<FormState>();
  
  //text field state
  String email = '';
  String password = '';
  String error = '';

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
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6  ? 'Enter a password 6+ char long' : null,
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
                  if (_formkey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'could not sign in with those credentials');
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
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
