import 'package:flutter/material.dart';
import 'package:merchant/common/styles.dart';

class PendingPickupScreen extends StatelessWidget {
  const PendingPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Danh sách lịch gom chưa sắp",
                style: AppTextStyles.titleSmall(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
