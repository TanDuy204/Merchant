import 'package:flutter/material.dart';
import 'package:merchant/common/styles.dart';
import 'package:merchant/views/collected/completed/completed_pickup.dart';
import 'package:merchant/views/collected/pending/pending_pickup.dart';
import 'package:merchant/views/collected/today_pickup.dart';

import '../../service/uidata.dart';

class CollectedScreen extends StatelessWidget {
  const CollectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Lịch gom",
            style: AppTextStyles.titleMedium(context),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Đã sắp'),
              Tab(text: 'Chưa sắp'),
              Tab(text: 'Hôm nay'),
            ],
            labelStyle: AppTextStyles.bodyMedium(context),
          ),
        ),
        body: TabBarView(
          children: [
            CompletedPickupScreen(
              schedules: schedules,
            ),
            const PendingPickupScreen(),
            const TodayPickupScreen(),
          ],
        ),
      ),
    );
  }
}
