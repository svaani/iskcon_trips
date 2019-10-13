import '../../models/Schedule.dart';

class ScheduleApi {
  Future<bool> addSchedule(schedule){

    return Schedule().addSchedule(schedule);
  }
}