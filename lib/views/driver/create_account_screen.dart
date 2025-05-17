import 'package:flutter/material.dart';
import 'package:merchant/common/custom_text_field.dart';

import '../../common/app_style.dart';
import '../../common/bordered_container.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPassController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            title: Text(
              'Tạo tài khoản tài xế',
              style: AppTextStyles.titleMedium(),
            )),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Text("Tạo tài khoản tài xế",
                      style: AppTextStyles.titleMedium()),
                  const SizedBox(height: 4),
                  Text(
                    "Tạo tài khoản tài xế thuộc quản lý của nhà thầu.",
                    style:
                        AppTextStyles.bodyMedium().copyWith(color: Colors.grey),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel(context, "Tên tài xế"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Số điện thoại"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Email"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Mật khẩu"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Số CCCD"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Số giấy phép lái xe"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      _buildLabel(context, "Hình ảnh giấy phép lái xe"),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F7FF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.upload_file, color: Colors.blue),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Chưa có tệp nào được chọn",
                                style: AppTextStyles.bodyMedium()
                                    .copyWith(color: AppColors.greyColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildLabel(context, "Địa chỉ"),
                      CustomTextField(controller: oldPassController, hint: ""),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightBlueColor),
                          child: Text(
                            "Lưu",
                            style: AppTextStyles.buttonLabel(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}

Widget _buildLabel(BuildContext context, String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 4),
    child: Text(label, style: AppTextStyles.bodyMedium()),
  );
}
