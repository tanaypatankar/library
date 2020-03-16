import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String pictid = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Color.fromRGBO(3,9,20, 1),
//    backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign In', style: TextStyle(color: Colors.white)),
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
                decoration: textInputDecoration.copyWith(hintText: 'PICT ID Number'),
                validator: (val)=>val.length<11 ? 'Enter a correct ID' : null,
                onChanged: (val) {
                  setState(()=>pictid=val);
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
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password, pictid);
                    print(result);
                    if(result == null){
                      setState((){
                        print("Here");
                        loading = false;
                        error = 'Enter valid email';
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
