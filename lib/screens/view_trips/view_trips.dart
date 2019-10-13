import 'dart:convert';

import 'package:flutter/material.dart';
import './view_trips_api.dart';

class ViewTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewTripsState();
  }
}

class ViewTripsState extends State<ViewTrips> {
  ViewTripsApi _api = ViewTripsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assign Details To Participants")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: _api.getZones(),
                builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                  if (itemsnapshot.connectionState == ConnectionState.done &&
                      itemsnapshot.hasData) {
                    if (itemsnapshot.hasError) {
                      return Text('Error: ${itemsnapshot.error}');
                    } else {
                      var list = (itemsnapshot.data);

                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: list.length,
                          padding: const EdgeInsets.all(15.0),
                          itemBuilder: (context, position) {
                            return ListTile(
                              title: Text('${list[position]["Name"]}'),
                              trailing: Icon(Icons.details),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (TripList(
                                          '${list[position]["ZoneId"]}',
                                          '${list[position]["Name"]}'))),
                                );
                              },
                            );
                          });
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
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

class TripList extends StatelessWidget {
  var _zoneId, _zoneName;
  ViewTripsApi _api = ViewTripsApi();

  TripList(zoneId, zoneName) {
    _zoneId = zoneId;
    _zoneName = zoneName;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip List for the Zone" + _zoneName),
      ),
      body: FutureBuilder(
          future: _api.getTripsByZone(_zoneId),
          builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
            if (itemsnapshot.connectionState == ConnectionState.done &&
                itemsnapshot.hasData) {
              List list = itemsnapshot.data;
              List<TableRow> arr = [];

              list.toList().forEach((trip) {
                // for(var val =0;val<trip.length;val++){
                //   print(val);
                //   print(trip[val]);
                // }
                //  List rowArr = [];
                //   trip.toList().forEach((key,entry){
                //      rowArr.add(Text(entry.toString()));
                //  });
                arr.add(
                  TableRow(
                    children: [
                      ListTile(
                        title: Text(trip.toString()),
                      ),
                    ],
                  ),
                );
              });
              if (itemsnapshot.hasError) {
                return Text('Error: ${itemsnapshot.error}');
              } else {
                return Column(
                  children: <Widget>[
                    Table(
                      children: arr.length > 0
                          ? arr
                          : [
                              TableRow(
                                children: [
                                  Center(
                                    child: Text("No Trips for this Zone"),
                                  ),
                                ],
                              ),
                            ],
                    ),
                  ],
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

// ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount: list.length,
//                     padding: const EdgeInsets.all(15.0),
//                     itemBuilder: (context, position) {
//
//                       ListTile(
//                           title: Text('${list[position]}'),
//                           trailing: Icon(Icons.details));
//                     })
