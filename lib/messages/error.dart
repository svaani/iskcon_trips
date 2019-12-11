import 'package:flutter/material.dart';

class Error {
  static GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Error.setKey(GlobalKey<ScaffoldState> key){
    _key = key;
  }

  Error(string){
    _key.currentState.showSnackBar(SnackBar( content: Text(string),backgroundColor: Colors.red));
  }
}