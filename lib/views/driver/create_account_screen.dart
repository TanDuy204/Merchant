import 'package:flutter/material.dart';

import '../../common/app_style.dart';
import '../../common/bordered_container.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPassController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            title: Text(
              'Tạo tài khoản tài xế',
              style: AppTextStyles.titleMedium(context),
            )),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text("Tạo tài khoản tài xế",
                        style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 4),
                    Text(
                      "Tạo tài khoản tài xế thuộc quản lý của nhà thầu.",
                      style: AppTextStyles.bodyMedium(context)
                          .copyWith(color: Colors.grey),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(context, "Tên tài xế"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        _buildLabel(context, "Số điện thoại"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        _buildLabel(context, "Email"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        _buildLabel(context, "Mật khẩu"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        _buildLabel(context, "Số CCCD"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        _buildLabel(context, "Số giấy phép lái xe"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
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
                                  style: AppTextStyles.bodyMedium(context)
                                      .copyWith(color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildLabel(context, "Địa chỉ"),
                        _buildCustomTextField(context, oldPassController,
                            hint: ""),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightBlueColor),
                            child: Text(
                              "Lưu",
                              style: AppTextStyles.buttonLabel(context),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

Widget _buildLabel(BuildContext context, String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 4),
    child: Text(label, style: AppTextStyles.bodyMedium(context)),
  );
}

Widget _buildCustomTextField(
  BuildContext context,
  TextEditingController controller, {
  required String hint,
  bool obscureText = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    style: AppTextStyles.bodyMedium(context),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bodyMedium(context)
          .copyWith(color: AppColors.greyColor),
      filled: true,
      fillColor: const Color(0xFFF1F7FF),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade900, width: 2),
      ),
    ),
  );
}
