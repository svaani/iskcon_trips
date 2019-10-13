import 'package:flutter/material.dart';
import '../tasks/tasks.dart';
import './login_api.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _loginCode = TextEditingController();
  LoginApi _api = LoginApi();

  _submit(context) async {
  //  if (await _api.login(_loginCode.text)) {
    if(true){
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => (Tasks())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            cursorWidth: 10,
            controller: _loginCode,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Enter Login Code'),
          ),
          RaisedButton(
              onPressed: () {
                _submit(context);
              },
              child: Text("LOGIN"),
              color: Colors.green)
        ],
      ),
    );
  }
}
