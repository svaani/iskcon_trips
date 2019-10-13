import '../../models/TripOrganiser.dart';

class LoginApi {
  Future<bool> login(code){
    return TripOrganiser().doesExist(code);
  }
}