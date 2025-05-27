import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merchant/common/custom_text_field.dart';

import '../../common/app_style.dart';
import '../../common/bordered_container.dart';
import '../../controllers/driver_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final DriverController driverController = Get.find<DriverController>();
  final ImagePicker _picker = ImagePicker();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cccdController = TextEditingController();
  final gplxController = TextEditingController();
  final addressController = TextEditingController();

  XFile? selectedGPLXImage;
  XFile? selectedCCCDImage;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cccdController.dispose();
    gplxController.dispose();
    addressController.dispose();
    super.dispose();
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

  Future<void> _pickCCCDImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        setState(() {
          selectedCCCDImage = image;
        });
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể chọn ảnh: $e');
    }
  }

  Future<void> _saveDriver() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        cccdController.text.isEmpty ||
        gplxController.text.isEmpty ||
        addressController.text.isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    final Map<String, String> fields = {
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text,
      'soCCCD': cccdController.text.trim(),
      'soGPLX': gplxController.text.trim(),
      'adress': addressController.text.trim(),
    };

    final success = await driverController.addDriver(
      fields,
      selectedGPLXImage!.path,
    );

    if (success) {
      _clearForm();
      Navigator.pop(context);
    }
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    cccdController.clear();
    gplxController.clear();
    addressController.clear();
    setState(() {
      selectedGPLXImage = null;
      selectedCCCDImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Tạo tài khoản tài xế',
          style: AppTextStyles.titleMedium(),
        ),
      ),
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
                      CustomTextField(
                          controller: nameController, hint: "Nhập tên tài xế"),
                      _buildLabel(context, "Số điện thoại"),
                      CustomTextField(
                          controller: phoneController,
                          hint: "Nhập số điện thoại"),
                      _buildLabel(context, "Email"),
                      CustomTextField(
                          controller: emailController, hint: "Nhập email"),
                      _buildLabel(context, "Mật khẩu"),
                      CustomTextField(
                          controller: passwordController,
                          hint: "Nhập mật khẩu",
                          obscureText: true),
                      _buildLabel(context, "Số CCCD"),
                      CustomTextField(
                          controller: cccdController, hint: "Nhập số CCCD"),
                      _buildLabel(context, "Số giấy phép lái xe"),
                      CustomTextField(
                          controller: gplxController, hint: "Nhập số GPLX"),
                      _buildLabel(context, "Hình ảnh giấy phép lái xe"),
                      _buildImagePicker(
                        selectedImage: selectedGPLXImage,
                        onTap: _pickGPLXImage,
                        placeholder: "Chưa có ảnh GPLX được chọn",
                      ),
                      _buildLabel(context, "Hình ảnh CCCD"),
                      _buildImagePicker(
                        selectedImage: selectedCCCDImage,
                        onTap: _pickCCCDImage,
                        placeholder: "Chưa có ảnh CCCD được chọn",
                      ),
                      _buildLabel(context, "Địa chỉ"),
                      CustomTextField(
                          controller: addressController, hint: "Nhập địa chỉ"),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() {
                          return ElevatedButton(
                            onPressed: driverController.isAdding.value
                                ? null
                                : _saveDriver,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightBlueColor,
                            ),
                            child: driverController.isAdding.value
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                : Text(
                                    "Lưu",
                                    style: AppTextStyles.buttonLabel(),
                                  ),
                          );
                        }),
                      ),
                      const SizedBox(height: 7),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker({
    required XFile? selectedImage,
    required VoidCallback onTap,
    required String placeholder,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F7FF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(
              selectedImage != null ? Icons.check_circle : Icons.upload_file,
              color: selectedImage != null ? Colors.green : Colors.blue,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                selectedImage != null ? selectedImage.name : placeholder,
                style: AppTextStyles.bodyMedium().copyWith(
                  color: selectedImage != null
                      ? Colors.black87
                      : AppColors.greyColor,
                ),
              ),
            ),
            if (selectedImage != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedImage == selectedGPLXImage) {
                      selectedGPLXImage = null;
                    } else {
                      selectedCCCDImage = null;
                    }
                  });
                },
                child: Icon(Icons.close, color: Colors.red, size: 20),
              ),
          ],
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
