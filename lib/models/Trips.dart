import 'data.dart';

class Trips {
    /**
     * TrUid - Unique Id for each trip
     * TrOid - Trip created by which TripOrganiserId
     * Name - Full Name of trip
     * TripType - long/short matches 1/0
     * HostedType - central/individual matches 1/0
     * Days - Number of days the trip goes for
     * Picture - Image of the trip
     * Details - Description
     * StartDate - start date of trip 
     * ZoneId -zone associated with the trip organiser
    */
    Trips(){

          dataRef = Data("Trips");
    }

    Data dataRef;
    Future<dynamic> getAllByZone(zoneId) async{
      return await dataRef.getBy("ZoneId",zoneId);
    }

    Future<bool>createTrip(trip) async{
      return await dataRef.add(trip);
    }

}