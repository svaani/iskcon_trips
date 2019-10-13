import './data.dart';

class Zone {
    /**
     * Name - Full Name of Trip Organiser
     * ZoneId - id of the zone
    */
    Zone(){

          dataRef = Data("Zone");
    }

    Data dataRef;
    Future<dynamic> getAll() async {
      return await dataRef.get();
    }

}