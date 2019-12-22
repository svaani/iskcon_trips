import 'package:flutter/material.dart';
import '../../messages/alert.dart';
import './schedule_api.dart';
import '../tasks/tasks.dart';

class Schedule extends StatefulWidget {
  static String _TrUid;

  Schedule(TrUid) {
    _TrUid = TrUid;
  }
  @override
  State<StatefulWidget> createState() {
    return ScheduleState(_TrUid);
  }
}

class ScheduleState extends State<Schedule> {
  static String _TrUid;

  TextEditingController _placeName = TextEditingController();

  TextEditingController _whichDay = TextEditingController();
  TextEditingController _details = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  var _hh = "00", _mm = "00";

  ScheduleApi _api = ScheduleApi();

  ScheduleState(TrUid) {
    _TrUid = TrUid;
    Alert.setKey(scaffoldkey);
  }

  _addReset() {
    _add();
    _placeName.text = "";
    _whichDay.text = "";
    _details.text = "";
    _hh = "00";
    _mm = "00";
  }

  _submit() {
    _add();
    Navigator.pop(context); //pop of schedule

    Navigator.pop(context);
  }

  _add() {
    _api.addSchedule({
      "PlaceName" : _placeName.text,
      "WhichDay" : _whichDay.text,
      "Details" : _details.text,
      "Time" : _hh.toString() +":"+_mm.toString()
    });
    Alert("Schedule Created!");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Schedule Sheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              cursorWidth: 10,
              controller: _placeName,
              decoration: InputDecoration(labelText: 'Place Name :'),
            ),
            TextField(
              cursorWidth: 10,
              controller: _whichDay,
              decoration: InputDecoration(
                  labelText: 'Which Day :', hintText: "Enter a number 1,2..."),
            ),
            Row(
              children: <Widget>[
                Text("Specify Time :    "),
                DropdownButton<String>(
                  value: _hh.toString(),
                  items: <String>[
                    '00',
                    '01',
                    '02',
                    '03',
                    '04',
                    '05',
                    '06',
                    '07',
                    '08',
                    '09',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                    '15',
                    '16',
                    '17',
                    '18',
                    '19',
                    '20',
                    '21',
                    '22',
                    '23'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  hint: Text('HH'),
                  onChanged: (hh) {
                    _hh = hh.toString();
                  },
                ),
                DropdownButton<String>(
                  value: _mm.toString(),
                  items: <String>['00', '15', '30', '45'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  hint: Text('MM'),
                  onChanged: (mm) {
                    _mm = mm.toString();
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: _details,
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: "Enter Place Description",
                    border: OutlineInputBorder(),
                    labelText: 'Details'),
              ),
            ),
            Align(
              heightFactor: 2.0,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {
                        _addReset();
                      },
                      child: Text("+1"),
                      color: Colors.teal),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submit(); //pop of createtrip
                    },
                    child: Icon(Icons.done),
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

// Align(
//   heightFactor: 2.0,
//   alignment: Alignment.bottomCenter,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: <Widget>[
//       FloatingActionButton(
//         onPressed: () {
//       //     Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => (null)),
//       // );
//         },
//         child: Text("+1"),
//       ),
//       SizedBox(
//         width: 10,
//       ),
//       FloatingActionButton(
//         onPressed: () {
//           // Navigator.pop(context);//pop of schedule

//           // Navigator.pop(context);//pop of createtrip
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => (Tasks())),
//           // );
//         },
//         child: Icon(Icons.done),
//       )
//     ],
//   ),
// )
