import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/custom_text_field.dart';

import '../../common/bordered_container.dart';

class EditDiverScreen extends StatelessWidget {
  const EditDiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedStatus = 'Hoạt động';
    bool resetPassword = false;

    final List<String> statusOptions = ['Hoạt động', 'Tạm ngưng', 'Nghỉ'];
    final TextEditingController oldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chỉnh sửa thông tin tài xế",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
        child: BorderedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(context, "Tên tài xế"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Số điện thoại"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Email"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Số CCCD"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Số giấy phép lái xe"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Địa chỉ"),
              CustomTextField(controller: oldController, hint: ""),
              _buildLabel(context, "Hình ảnh giấy phép lái xe"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F7FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.upload_file,
                      color: Colors.blue,
                      size: AppDimensions.iconMedium(context),
                    ),
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
              _buildLabel(context, "Trạng thái"),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: statusOptions.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintStyle: AppTextStyles.bodyMedium(context)
                      .copyWith(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF1F7FF),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.grey.shade900, width: 2),
                  ),
                ),
                style: AppTextStyles.bodyMedium(context),
                dropdownColor: Colors.white,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: AppDimensions.paddingXXTiny(context),
                    child: Checkbox(
                      value: false,
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("Đặt mặt khẩu về mặc định",
                      style: AppTextStyles.bodySmall(context)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Cập nhật',
                    style: AppTextStyles.buttonLabel(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLabel(BuildContext context, String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 4),
    child: Text(label, style: AppTextStyles.bodyMedium(context)),
  );
}
