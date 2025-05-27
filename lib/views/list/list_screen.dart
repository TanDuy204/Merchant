import 'package:flutter/material.dart';
import 'package:merchant/views/list/pending/pending_list.dart';
import 'package:merchant/views/list/return/return_list.dart';
import 'package:merchant/views/list/sent/sent_list.dart';

import '../../common/app_style.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bảng kê",
            style: AppTextStyles.titleMedium(),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Đã gửi'),
              Tab(text: 'Chưa gửi'),
              Tab(text: 'Trả lại'),
            ],
            indicatorColor: AppColors.lightBlueColor,
            labelStyle: AppTextStyles.bodyMedium(),
          ),
        ),
        body: TabBarView(
          children: [
            const SentList(),
            PendingList(),
            const ReturnList(),
          ],
        ),
      ),
    );
  }
}
