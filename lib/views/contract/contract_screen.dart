import 'package:flutter/material.dart';
import 'package:merchant/views/contract/active/active_contract.dart';
import 'package:merchant/views/contract/confirm/confirm_contract.dart';
import 'package:merchant/views/contract/expired/expired_contract.dart';
import 'package:merchant/views/contract/supplement/supplement_contract.dart';

import '../../common/app_style.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Hợp đồng",
            style: AppTextStyles.titleMedium(context),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Còn hạn'),
              Tab(text: 'Hết hạn'),
              Tab(text: 'Xác nhận'),
              Tab(text: 'Phụ lục'),
            ],
            labelStyle: AppTextStyles.bodyMedium(context),
          ),
        ),
        body: const TabBarView(
          children: [
            ActiveContract(),
            ExpiredContract(),
            ConfirmContract(),
            SupplementContract(),
          ],
        ),
      ),
    );
  }
}
