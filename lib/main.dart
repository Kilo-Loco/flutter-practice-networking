import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_networking/user_cell.dart';
import 'dart:async';
import 'dart:convert';
import 'user.dart';
import 'loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  initState() {
    super.initState();
    _getUsers();
  }

  Future<List<User>> _getUsers() async {
    final response = await http.get('https://kiloloco.com/api/users');

    var usersResponse = json.decode(response.body);

    List<User> users = [];
    for (var i = 0; i < usersResponse.length; i++) {
      var user = User.fromJson(usersResponse[i]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return buildUserCell(snapshot.data[index]);
                },
              );
            } else {
              return buildLoadingView();
            }
          }, 
        )
      )
    );
  }
}