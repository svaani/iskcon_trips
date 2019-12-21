import 'package:flutter/material.dart';
import '../../messages/alert.dart';
import './create_trip_api.dart';
import '../schedule/schedule.dart';

class CreateTrip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateTripState();
  }
}

class CreateTripState extends State<CreateTrip> {

  TextEditingController _name = TextEditingController();
  
  TextEditingController _duration = TextEditingController();


  TextEditingController _startDate = TextEditingController();
  
  TextEditingController _details = TextEditingController();

  var _tripType = 0, _hostedType = 0;
  
  CreateTripApi _api = CreateTripApi();

  _submit(){
    var uid =DateTime.now().millisecond.toString();
    _api.createTrip({"Name":_name.text,
    "TripType":_tripType.toString(),
    "HostedType":_hostedType.toString(),
    "Days":_duration.text,
    "StartDate":_startDate.text,
    "Details":_details.text,
    "TrUid":uid,
    "TrOid" : "BLR_Or_01",
    "ZoneId" : "BLR_01"
    });
    
    Alert("Trip $_name Created");
    // Future.delayed(Duration(seconds:2), );
    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (Schedule(uid))),
                  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Trip"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              cursorWidth: 10,
              controller: _name,
              decoration: InputDecoration(labelText: 'Name the Trip :'),
            ),
            DropdownButton(
              value: _tripType.toString(),
              items: [
                DropdownMenuItem<String>(
                  value: "0",
                  child: Text(
                    "Short Trip",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "1",
                  child: Text(
                    "Long Trip",
                  ),
                ),
              ],
              onChanged: (val) {
                _tripType = val;
              },
              isExpanded: true,
              hint: Text('Trip Type :'),
            ),
            DropdownButton(
              value: _hostedType.toString(),
              items: [
                DropdownMenuItem<String>(
                  value: "0",
                  child: Text(
                    "Centrally Hosted",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "1",
                  child: Text(
                    "Individually Hosted",
                  ),
                ),
              ],
              onChanged: (val) {
                _hostedType = val;
              },
              isExpanded: true,
              hint: Text('How is it Hosted?'),
            ),
            TextField(
              cursorWidth: 10,
              controller: _duration,
        
              decoration: InputDecoration(labelText: 'Duration in Days:'),
            ),
            TextField(
              cursorWidth: 10,
              controller: _startDate,
   
              decoration: InputDecoration(labelText: 'Trip Start Date:'),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child:TextField(
              controller: _details,
              maxLines: 8,
              decoration: InputDecoration(
                  hintText: "Enter Trip Description",
                  border: OutlineInputBorder(),
                  labelText: 'Details'),
            ),
            ),
            Align(
              heightFactor: 2.0,
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _submit();
                  
                },
                child: Icon(Icons.done),
              ),
            )
          ],
        ),
      ),
    );
  }
}
