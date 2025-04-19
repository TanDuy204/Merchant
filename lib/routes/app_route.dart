import 'package:get/get.dart';
import 'package:merchant/views/collected/collected_screen.dart';
import 'package:merchant/views/contract/active/active_contract_detail.dart';
import 'package:merchant/views/contract/confirm/confirm_contract_detail.dart';
import 'package:merchant/views/contract/contract_screen.dart';
import 'package:merchant/views/debt/debt_screen.dart';
import 'package:merchant/views/driver/create_account_screen.dart';
import 'package:merchant/views/driver/driver_account_screen.dart';
import 'package:merchant/views/driver/invite_account_screen.dart';
import 'package:merchant/views/list/list_screen.dart';
import 'package:merchant/views/list/pending/pending_list_detail.dart';
import 'package:merchant/views/list/return/return_list_detail.dart';
import 'package:merchant/views/list/sent/sent_list_detail.dart';
import 'package:merchant/views/login/login_screen.dart';
import 'package:merchant/views/profile/profile_account.dart';
import 'package:merchant/views/schedule/schedule_screen.dart';
import 'package:merchant/views/truck/truck_detail.dart';
import 'package:merchant/views/truck/truck_screen.dart';

import '../service/uidata.dart';
import '../views/collected/completed/completed_pickup_detail.dart';
import '../views/entrypoint.dart';
import '../views/schedule/schedule_collected_screen.dart';

class AppRoutes {
  static const String main = '/main';
  static const String login = '/login';
  static const String schedule = '/schedule';
  static const String collectSchedule = '/collectSchedule';
  static const String truck = '/truck';
  static const String truckDetail = '/truckDetail';
  static const String collected = '/collected';
  static const String completedCollected = '/completedCollected';
  static const String pendingCollected = '/pendingCollected';
  static const String todayCollected = '/todayCollected';
  static const String debt = '/debt';
  static const String list = '/list';
  static const String sentList = '/sentList';
  static const String pendingList = '/pendingList';
  static const String returnList = '/returnList';
  static const String contract = '/contract';
  static const String activeContract = '/activeContract';
  static const String confirmContract = '/confirmContract';
  static const String expiredContract = '/expiredContract';
  static const String profileAccount = '/profileAccount';
  static const String driverAccount = '/driverAccount';
  static const String createAccount = '/createAccount';
  static const String inviteAccount = '/inviteAccount';

  static final pages = [
    GetPage(name: login, page: () => LoginScreen()),
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
    GetPage(
        name: completedCollected,
        page: () => const CompletedPickupDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: pendingCollected,
        page: () => const CompletedPickupDetail(),
        transition: Transition.rightToLeft),
    GetPage(
        name: todayCollected,
        page: () => const CompletedPickupDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: debt,
        page: () => DebtScreen(debt: mockDebts),
        transition: Transition.fadeIn),
    GetPage(
        name: list,
        page: () => const ListScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: sentList,
        page: () => const SentListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: pendingList,
        page: () => const PendingListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: returnList,
        page: () => const ReturnListDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: contract,
        page: () => const ContractScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: activeContract,
        page: () => const ActiveContractDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: confirmContract,
        page: () => const ConfirmContractDetail(),
        transition: Transition.fadeIn),
    GetPage(
        name: profileAccount,
        page: () => const ProfileAccount(),
        transition: Transition.fadeIn),
    GetPage(
        name: driverAccount,
        page: () => const DriverAccountScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: createAccount,
        page: () => const CreateAccountScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: inviteAccount,
        page: () => const InviteAccountScreen(),
        transition: Transition.fadeIn),
  ];
}
