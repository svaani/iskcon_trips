import 'data.dart';

class Schedule {
    /**
     * TrUid - Unique Id for each trip
     * PlaceName - Full Name of trip
     * Time - HH:MM
     * WhichDay - The day of schedule
     * SUid - unique Id for schedule record
    */
    Schedule(){

          dataRef = Data("Schedule");
    }

    Data dataRef;

    Future<bool> addSchedule(tripDay) async{
      return await dataRef.add(tripDay);
    }
}