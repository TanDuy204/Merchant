import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/custom_text_field.dart';

import '../../common/bordered_container.dart';
import '../../controllers/driver_controller.dart';
import '../../models/user.dart';

class EditDriverScreen extends StatefulWidget {
  final User driver;

  const EditDriverScreen({super.key, required this.driver});

  @override
  State<EditDriverScreen> createState() => _EditDriverScreenState();
}

class _EditDriverScreenState extends State<EditDriverScreen> {
  final DriverController driverController = Get.find<DriverController>();
  final ImagePicker _picker = ImagePicker();

  // Controllers với dữ liệu hiện tại
  late final TextEditingController nameController =
      TextEditingController(text: widget.driver.name ?? '');
  late final TextEditingController phoneController =
      TextEditingController(text: widget.driver.phone ?? '');
  late final TextEditingController emailController =
      TextEditingController(text: widget.driver.email ?? '');
  late final TextEditingController cccdController =
      TextEditingController(text: widget.driver.soCCCD ?? '');
  late final TextEditingController gplxController =
      TextEditingController(text: widget.driver.soGPLX ?? '');
  late final TextEditingController addressController =
      TextEditingController(text: widget.driver.adress ?? '');

  // Dropdown và checkbox states
  String selectedStatus = 'Hoạt động';
  bool resetPassword = false;
  XFile? selectedGPLXImage;

  final List<String> statusOptions = [
    'Hoạt động',
    'Tạm ngưng',
    'Khóa vĩnh viễn'
  ];

  @override
  void initState() {
    super.initState();
    selectedStatus = _mapDriverStatusToDisplay(widget.driver.status);
    driverController.clearError();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cccdController.dispose();
    gplxController.dispose();
    addressController.dispose();
    super.dispose();
  }

  String _mapDriverStatusToDisplay(String? status) {
    switch (status?.toLowerCase()) {
      case 'hoạt động':
        return 'Hoạt động';

      case 'tạm ngưng':
        return 'Tạm ngưng';
      case 'khóa vĩnh viễn':
        return 'Khóa vĩnh viễn';
      default:
        return 'Hoạt động';
    }
  }

  Future<void> _pickGPLXImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        setState(() {
          selectedGPLXImage = image;
        });
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể chọn ảnh: $e');
    }
  }

  Future<void> _updateDriver() async {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        cccdController.text.trim().isEmpty ||
        gplxController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    final Map<String, dynamic> data = {};

    if (nameController.text.trim() != (widget.driver.name ?? '')) {
      data['name'] = nameController.text.trim();
    }
    if (phoneController.text.trim() != (widget.driver.phone ?? '')) {
      data['phone'] = phoneController.text.trim();
      data['username'] = phoneController.text.trim();
    }
    if (emailController.text.trim() != (widget.driver.email ?? '')) {
      data['email'] = emailController.text.trim();
    }
    if (cccdController.text.trim() != (widget.driver.soCCCD ?? '')) {
      data['soCCCD'] = cccdController.text.trim();
    }
    if (gplxController.text.trim() != (widget.driver.soGPLX ?? '')) {
      data['soGPLX'] = gplxController.text.trim();
    }
    if (addressController.text.trim() != (widget.driver.adress ?? '')) {
      data['adress'] = addressController.text.trim();
    }

    String apiStatus = _mapDriverStatusToDisplay(selectedStatus);
    if (apiStatus != widget.driver.status) {
      data['status'] = apiStatus;
    }

    if (resetPassword) {
      data['reset_password'] = true;
    }

    if (selectedGPLXImage != null) {
      data['img_GPLX_path'] = selectedGPLXImage!.path;
    }

    if (data.isEmpty) {
      Get.snackbar('Thông báo', 'Không có thay đổi nào để cập nhật');
      return;
    }

    final success =
        await driverController.updateDriver(widget.driver.id!, data);

    if (success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chỉnh sửa thông tin tài xế",
          style: AppTextStyles.titleMedium(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10.h),
        child: BorderedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(context, "Tên tài xế"),
              CustomTextField(
                  controller: nameController, hint: "Nhập tên tài xế"),
              _buildLabel(context, "Số điện thoại"),
              CustomTextField(
                  controller: phoneController, hint: "Nhập số điện thoại"),
              _buildLabel(context, "Email"),
              CustomTextField(controller: emailController, hint: "Nhập email"),
              _buildLabel(context, "Số CCCD"),
              CustomTextField(controller: cccdController, hint: "Nhập số CCCD"),
              _buildLabel(context, "Số giấy phép lái xe"),
              CustomTextField(controller: gplxController, hint: "Nhập số GPLX"),
              _buildLabel(context, "Địa chỉ"),
              CustomTextField(
                  controller: addressController, hint: "Nhập địa chỉ"),
              _buildLabel(context, "Hình ảnh giấy phép lái xe"),
              GestureDetector(
                onTap: _pickGPLXImage,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F7FF),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedGPLXImage != null
                            ? Icons.check_circle
                            : Icons.upload_file,
                        color: selectedGPLXImage != null
                            ? Colors.green
                            : Colors.blue,
                        size: 28.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          selectedGPLXImage != null
                              ? selectedGPLXImage!.name
                              : widget.driver.imgGPLXPath != null &&
                                      widget.driver.imgGPLXPath!.isNotEmpty
                                  ? widget.driver.imgGPLXPath!.split('/').last
                                  : "Chưa có tệp nào được chọn",
                          style: AppTextStyles.bodyMedium().copyWith(
                              color: selectedGPLXImage != null
                                  ? Colors.black87
                                  : AppColors.greyColor),
                        ),
                      ),
                      if (selectedGPLXImage != null)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGPLXImage = null;
                            });
                          },
                          child:
                              Icon(Icons.close, color: Colors.red, size: 20.sp),
                        ),
                    ],
                  ),
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
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedStatus = value;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintStyle:
                      AppTextStyles.bodyMedium().copyWith(color: Colors.grey),
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
                style: AppTextStyles.bodyMedium(),
                dropdownColor: Colors.white,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.r,
                    child: Checkbox(
                      value: resetPassword,
                      onChanged: (value) {
                        setState(() {
                          resetPassword = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("Đặt mật khẩu về mặc định",
                      style: AppTextStyles.bodySmall()),
                ],
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: driverController.isUpdating.value
                        ? null
                        : _updateDriver,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: driverController.isUpdating.value
                        ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Cập nhật',
                            style: AppTextStyles.buttonLabel(),
                          ),
                  );
                }),
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
    child: Text(label, style: AppTextStyles.bodyMedium()),
  );
}
