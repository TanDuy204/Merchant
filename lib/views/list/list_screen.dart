import 'package:flutter/material.dart';
import 'package:merchant/service/uidata.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bảng kê",
            style: AppTextStyles.titleMedium(context),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Đã gửi'),
              Tab(text: 'Chưa gửi'),
              Tab(text: 'Trả lại'),
            ],
            labelStyle: AppTextStyles.bodyMedium(context),
          ),
        ),
        body: TabBarView(
          children: [
            SentList(),
            PendingList(
              schedules: schedules,
            ),
            ReturnList(),
          ],
        ),
      ),
    );
    ;
  }
}
