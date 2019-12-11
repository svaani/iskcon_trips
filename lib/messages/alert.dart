import 'package:flutter/material.dart';

class Alert {
  static GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Alert.setKey(GlobalKey<ScaffoldState> key){
    _key = key;
  }

  Alert(string){
    _key.currentState.showSnackBar(SnackBar( content: Text(string),backgroundColor: Colors.green));
  }
}