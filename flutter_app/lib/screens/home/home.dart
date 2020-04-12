import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/screens/home/book_list.dart';
import 'package:flutter_app/screens/authenticate/pictlogin_scraper.dart';
import 'package:flutter_app/services/firebasemessaging.dart';
import 'package:flutter_app/screens/home/searchbook.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(3,9,20, 1),
          appBar: AppBar(
            title:  Text('Library'),
            backgroundColor: Colors.blue[600],
            elevation: 0.0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.book)),
                Tab(icon: Icon(Icons.search)),
              ],
            ),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person, color: Colors.white,),
                label: Text('Logout', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  final user= Provider.of<User>(context, listen: false);
                  await _auth.signout(user.uid);
                } ,
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              BookList(),
              SearchBook(),
//              PictLogin(),
//              FirebaseMessagingNotif(),
              //Text("Other one Selected", style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      )
    );
  }
}
