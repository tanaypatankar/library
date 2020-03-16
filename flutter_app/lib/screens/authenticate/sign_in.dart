import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():  Scaffold(
      backgroundColor: Color.fromRGBO(3,9,20, 1),
//    backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign Up', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              widget.toggleView();
            } ,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              TextFormField(

                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: textInputDecoration,
                validator: (val)=>val.isEmpty ? 'Enter a Email' : null,
                onChanged: (val) {
                  setState(()=>email=val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(

                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val)=>val.length<6 ? 'Enter a Password with atleast 6 characters' : null,
                onChanged: (val) {
                  setState(()=>password=val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.lightBlue,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() => loading = true);
                    print('valid');
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        loading = false;
                        error = 'Could not Sign In with those credentials';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
