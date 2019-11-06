import 'package:flutter/material.dart';
import 'package:iskcon_trips/screens/invite/invite_api.dart';

class Invite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InviteState();
  }
}

class InviteState extends State<Invite> {
  InviteApi _api = InviteApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invite To Participate")),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: _api.getTrips("BLR_01"),
                  builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                    if (itemsnapshot.connectionState == ConnectionState.done &&
                        itemsnapshot.hasData) {
                      List list = itemsnapshot.data;
                      return DropdownButton(
                        items: list
                            .map((item) => DropdownMenuItem<String>(
                                value: item["TrUid"].toString(), child: Text(item["Name"])))
                            .toList(),
                        //  [
                        //   DropdownMenuItem<String>(
                        //     value: "0",
                        //     child: Text(
                        //       list.toString(),
                        //     ),
                        //   ),
                        // ],
                        onChanged: (val) {
                          print(val);
                        },
                        isExpanded: true,
                        hint: Text('Select Trip :'),
                      );
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
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
                  onPressed: () {},
                  child: Text("Send Email!"),
                  color: Colors.green,
                ),
              )
            ],
          )),
    );
  }
}
