import 'package:flutter/material.dart';

import '../../common/app_dimensions.dart';
import '../../common/app_style.dart';
import '../../common/bordered_container.dart';

class InviteAccountScreen extends StatelessWidget {
  const InviteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Gửi lời mời tài xế',
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gửi lời mời tài xế',
                    style: AppTextStyles.titleMedium(context),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'Thêm mới tài xế bằng cách gửi email, tài xế sẽ được thêm vào nhà xe khi đồng ý thông qua email',
                      style: AppTextStyles.bodyMedium(context)
                          .copyWith(color: AppColors.greyColor)),
                  const SizedBox(height: 20),
                  Text('Vui lòng nhập email tài xế mà bạn muốn gửi lời mời',
                      style: AppTextStyles.bodyMedium(context)),
                  const SizedBox(height: 8),
                  Text('Email', style: AppTextStyles.bodyMedium(context)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nhập email tài xế',
                      hintStyle: AppTextStyles.bodyMedium(context)
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
                        style: AppTextStyles.buttonLabel(context),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightBlueColor,
                        foregroundColor: AppColors.whiteColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingMedium(context),
                            vertical: AppDimensions.paddingSmall(context)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
