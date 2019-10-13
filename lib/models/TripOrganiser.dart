import './data.dart';

class TripOrganiser {
    /**
     * TrOid - Trip created by which TripOrganiserId
     * Name - Full Name of Trip Organiser
     * ZoneId - id of the zone
     * LoginCode - Code that's used to login
    */
    TripOrganiser(){
      dataRef = Data("TripOrganiser");
    }

    Data dataRef;

    Future<bool> doesExist(code) async {
      return await dataRef.doesExist("LoginCode",code);
    }
}