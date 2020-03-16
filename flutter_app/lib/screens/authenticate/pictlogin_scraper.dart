import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/helper.dart';

class PictLogin extends StatefulWidget {
  @override
  _PictLoginState createState() => _PictLoginState();
}

class _PictLoginState extends State<PictLogin> {
  Helper _helper = Helper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder(
        future: _helper.checkCreds('I2K18102560', 'Himym123qwe@tanay'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              Text(
                "Other one Selected", style: TextStyle(color: Colors.white),);
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              Text(
                "Other one Selected", style: TextStyle(color: Colors.white),);
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              Text(
                "Other one Selected", style: TextStyle(color: Colors.white),);
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              Text(
                "Other one Selected", style: TextStyle(color: Colors.white),);
              // TODO: Handle this case.
              break;
          }
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(snapshot.data[index]),
              );
            },
          );
        }
      ),
    );
  }
}
