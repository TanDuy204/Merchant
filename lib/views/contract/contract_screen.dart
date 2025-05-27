import 'package:flutter/material.dart';
import 'package:merchant/views/contract/active/active_contract.dart';
import 'package:merchant/views/contract/confirm/confirm_contract.dart';
import 'package:merchant/views/contract/expired/expired_contract.dart';
import 'package:merchant/views/contract/supplement/supplement_contract.dart';

import '../../common/app_style.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
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
        title: Text(
          "Hợp đồng",
          style: AppTextStyles.titleMedium(),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Còn hạn'),
            Tab(text: 'Hết hạn'),
            Tab(text: 'Xác nhận'),
            Tab(text: 'Phụ lục'),
          ],
          indicatorColor: AppColors.lightBlueColor,
          labelStyle: AppTextStyles.bodyMedium(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ActiveContract(),
          ExpiredContract(),
          ConfirmContract(),
          SupplementContract(),
        ],
      ),
    );
  }
}
