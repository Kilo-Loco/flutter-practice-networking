import 'package:flutter/material.dart';
import 'user.dart';

Widget buildUserCell(User user) {
  return ListTile(
    leading: Icon(
      Icons.account_circle, 
      color: Colors.purpleAccent,
    ),
    title: Text(user.name),
    trailing: Icon(Icons.chevron_right),
  );
}