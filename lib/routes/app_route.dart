import 'package:get/get.dart';
import 'package:merchant/views/collected/collected_screen.dart';
import 'package:merchant/views/contract/active/active_contract_detail.dart';
import 'package:merchant/views/contract/confirm/confirm_contract_detail.dart';
import 'package:merchant/views/contract/contract_screen.dart';
import 'package:merchant/views/contract/expired/expired_contract_detail.dart';
import 'package:merchant/views/driver/create_account_screen.dart';
import 'package:merchant/views/driver/driver_account_screen.dart';
import 'package:merchant/views/driver/invite_account_screen.dart';
import 'package:merchant/views/list/list_screen.dart';
import 'package:merchant/views/list/pending/pending_list_detail.dart';
import 'package:merchant/views/list/return/return_list_detail.dart';
import 'package:merchant/views/list/sent/sent_list_detail.dart';
import 'package:merchant/views/login/login_screen.dart';
import 'package:merchant/views/truck/truck_detail.dart';
import 'package:merchant/views/truck/truck_screen.dart';

import '../views/collected/completed/completed_pickup_detail.dart';
import '../views/debt/debt_screen.dart';
import '../views/entrypoint.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/main', page: () => const MainScreen()),
    // GetPage(
    //     name: '/schedule',
    //     page: () => ScheduleScreen(
    //           schedules: schedules,
    //         ),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: '/collectSchedule',
    //     page: () => const CollectionScheduleScreen(),
    //     transition: Transition.fadeIn),
    GetPage(
        name: '/truck',
        page: () => const TruckScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/truckDetail',
        page: () => const TruckDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/collected',
        page: () => const CollectedScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/completedCollected',
        page: () => const CompletedPickupDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/pendingCollected',
        page: () => const CompletedPickupDetail(),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/todayCollected',
        page: () => const CompletedPickupDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/debt', page: () => DebtScreen(), transition: Transition.fadeIn),
    GetPage(
        name: '/list',
        page: () => const ListScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/sentList',
        page: () => const SentListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/pendingList',
        page: () => const PendingListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/returnList',
        page: () => const ReturnListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/contract',
        page: () => const ContractScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/activeContract',
        page: () => const ActiveContractDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/confirmContract',
        page: () => const ConfirmContractDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/expiredContract',
        page: () => const ExpiredContractDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/driverAccount',
        page: () => DriverAccountScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/createAccount',
        page: () => const CreateAccountScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/inviteAccount',
        page: () => const InviteAccountScreen(),
        transition: Transition.fadeIn),
  ];
}
