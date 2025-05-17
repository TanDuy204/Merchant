import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_style.dart';
import '../../common/bordered_container.dart';

class InviteAccountScreen extends StatelessWidget {
  const InviteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Gửi lời mời tài xế',
          style: AppTextStyles.titleMedium(),
        ),
      ),
      body: SingleChildScrollView(
        child: BorderedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gửi lời mời tài xế',
                style: AppTextStyles.titleMedium(),
              ),
              const SizedBox(height: 8),
              Text(
                  'Thêm mới tài xế bằng cách gửi email, tài xế sẽ được thêm vào nhà xe khi đồng ý thông qua email',
                  style: AppTextStyles.bodyMedium()
                      .copyWith(color: AppColors.greyColor)),
              const SizedBox(height: 20),
              Text('Vui lòng nhập email tài xế mà bạn muốn gửi lời mời',
                  style: AppTextStyles.bodyMedium()),
              const SizedBox(height: 8),
              Text('Email', style: AppTextStyles.bodyMedium()),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập email tài xế',
                  hintStyle: AppTextStyles.bodyMedium()
                      .copyWith(color: AppColors.greyColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: Text(
                    'Gửi lời mời',
                    style: AppTextStyles.buttonLabel(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlueColor,
                    foregroundColor: AppColors.whiteColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
