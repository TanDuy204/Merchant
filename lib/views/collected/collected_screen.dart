import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/controllers/date_filter_controller.dart';
import 'package:merchant/views/collected/completed/completed_pickup.dart';
import 'package:merchant/views/collected/pending/pending_pickup.dart';
import 'package:merchant/views/collected/today/today_pickup.dart';

import '../../common/custom_datapicker.dart';

class CollectedScreen extends StatefulWidget {
  const CollectedScreen({super.key});

  @override
  State<CollectedScreen> createState() => _CollectedScreenState();
}

class _CollectedScreenState extends State<CollectedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DateFilterController dateFilterController =
      Get.put(DateFilterController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index != 0) {
        dateFilterController.resetFilter();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Lịch gom", style: AppTextStyles.titleMedium()),
        actions: [
          if (_tabController.index != 2)
            Obx(() {
              final hasFilter = dateFilterController.fromDate.value != null ||
                  dateFilterController.toDate.value != null;
              return IconButton(
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: hasFilter ? AppColors.blueColor : Colors.black,
                  size: 23.sp,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (_) => CustomDataPicker(
                            initialFromDate:
                                dateFilterController.fromDate.value,
                            initialToDate: dateFilterController.toDate.value,
                            onConfirm: (DateTime? from, DateTime? to) {
                              if (from != null && to != null) {
                                dateFilterController.setFromDate(from);
                                dateFilterController.setToDate(to);
                                Get.back();
                              }
                            },
                            onCancel: () {
                              dateFilterController.resetFilter();
                              Get.back();
                            },
                          ));
                },
              );
            }),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Đã sắp'),
            Tab(text: 'Chưa sắp'),
            Tab(text: 'Hôm nay'),
          ],
          indicatorColor: AppColors.lightBlueColor,
          labelStyle: AppTextStyles.bodyMedium(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const CompletedPickupScreen(),
          const PendingPickupScreen(),

          const TodayPickupScreen()
          // TodayPickupScreen(),
        ],
      ),
    );
  }
}
