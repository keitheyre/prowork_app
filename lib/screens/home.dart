import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return Align(
              alignment: Alignment.topCenter,
              // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                snapshot.data.uid,
                style: TextStyle(
                  fontSize: 20.0,
                  color:  Colors.blue
                ),
              ),
            );
          } else {
            return Text('Loading...');
          }
        },
      ),
    );
  }
}
