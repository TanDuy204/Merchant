import 'package:get/get.dart';
import 'package:merchant/views/collected/collected_screen.dart';
import 'package:merchant/views/schedule/schedule_screen.dart';
import 'package:merchant/views/truck/truck_detail.dart';
import 'package:merchant/views/truck/truck_screen.dart';

import '../service/uidata.dart';
import '../views/entrypoint.dart';
import '../views/schedule/schedule_collected_screen.dart';

class AppRoutes {
  static const String main = '/main';
  static const String schedule = '/schedule';
  static const String collectSchedule = '/collectSchedule';
  static const String truck = '/truck';
  static const String truckDetail = '/truckDetail';
  static const String collected = '/collected';

  static final pages = [
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(
        name: schedule,
        page: () => ScheduleScreen(schedules: schedules),
        transition: Transition.fadeIn),
    GetPage(
        name: collectSchedule,
        page: () => const CollectionScheduleScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: truck,
        page: () => TruckScreen(trucks: trucks),
        transition: Transition.fadeIn),
    GetPage(
        name: truckDetail,
        page: () => const TruckDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: collected,
        page: () => const CollectedScreen(),
        transition: Transition.fadeIn),
  ];
}
