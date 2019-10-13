import '../../models/Trips.dart';

class CreateTripApi {

  Future<bool> createTrip(trip){
    return Trips().createTrip(trip);
  }

}