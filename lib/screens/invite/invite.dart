import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InviteState();
  }
}

class InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invite To Participate")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
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
              hint: Text('Select Trip :'),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child:TextField(
              maxLines: 8,
              decoration: InputDecoration(
                  hintText: "Type the text to be sent to invite",
                  border: OutlineInputBorder(),
                  labelText: 'Details'),
            ),
            ),
            Align(
              heightFactor: 2.0,
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                onPressed: () {
                  
                },
                child: Text("Send Email!"),
                color: Colors.green,
              ),
            )
        ],)
      ),
    );
  }
}
