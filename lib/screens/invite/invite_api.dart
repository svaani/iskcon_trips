import '../../models/Trips.dart';

class InviteApi {

  Future<dynamic> getTrips(zoneId){
    return Trips().getAllByZone(zoneId);
  }

}