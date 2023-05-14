import 'package:flutter/material.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(
     MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        cardColor: Colors.grey[100],
      ),
      home: LoginScreen(),
    ),
  );
}
