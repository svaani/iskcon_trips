import '../../models/zone.dart';
import '../../models/Trips.dart';

class ViewTripsApi {
  Future<dynamic> getZones(){
    return Zone().getAll();
  }

  Future<dynamic> getTripsByZone(zoneId){
    return Trips().getAllByZone(zoneId);
  }
}