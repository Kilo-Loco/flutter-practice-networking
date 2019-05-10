import 'package:flutter/material.dart';

Widget buildLoadingView() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Loading...'),
        )
      ],
    ),
  );
}