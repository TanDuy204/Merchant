import 'package:flutter/material.dart';
import 'package:merchant/common/app_style.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hộp thư",
          style: AppTextStyles.titleMedium(),
        ),
      ),
    );
  }
}
