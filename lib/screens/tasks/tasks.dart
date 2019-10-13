import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../assign_details/assign_details.dart';
import '../view_trips/view_trips.dart';
import '../invite/invite.dart';
import '../create_trip/create_trip.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome! Actions to Perform..")),
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text("Create Trip"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (CreateTrip())),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("View Trips"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (ViewTrips())),
                  );
                }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Assign Travel Details"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (AssignDetails())),
                  );
                  }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Invite Participants"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (Invite())),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
