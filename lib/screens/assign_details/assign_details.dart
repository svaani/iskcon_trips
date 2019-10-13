import 'package:flutter/material.dart';

class AssignDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AssignDetailsState();
  }
}

class AssignDetailsState extends State<AssignDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assign Details To Participants")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  value: "0",
                  child: Text(
                    "Sample",
                  ),
                ),
              ],
              onChanged: (val) {
                print(val);
              },
              isExpanded: true,
              hint: Text('Select Participant : '),
            ),
            TextField(
              cursorWidth: 10,
              //   controller: _loginCode,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Flight PNR No :'),
            ),
            
            TextField(
              cursorWidth: 10,
              //   controller: _loginCode,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Seat No :'),
            ),
            
            TextField(
              cursorWidth: 10,
              //   controller: _loginCode,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Room No :'),
            ),
            Align(
              heightFactor: 2.0,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context); 

                    },
                    child: Text("Done"),
                    color: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
