import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';

class BookTile extends StatelessWidget {

  final DocumentSnapshot book;
  BookTile({this.book});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.pink,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Color.fromRGBO((book['deadline'])*100, -(book['deadline'])*100-100, 0, 1),
          ),
          title: Text(book['name']),
          subtitle: Text(book['author'] + '   Days Left : ${book['deadline']}'),
        ),
      ),
    );
  }
}
