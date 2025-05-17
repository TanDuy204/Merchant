import 'package:flutter/material.dart';

import '../../common/app_style.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thanh toán",
          style: AppTextStyles.titleMedium(),
        ),
      ),
    );
  }
}
