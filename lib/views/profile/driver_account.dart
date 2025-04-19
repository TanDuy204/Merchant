import 'package:flutter/material.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';

class DriverAccount extends StatelessWidget {
  const DriverAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: "Nha Thau");
    final emailController = TextEditingController(text: "nhathau@gmail.com");

    final oldPassController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor ,
        centerTitle: true,
        title: Text(
          "Thông tin nhà thầu",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ///Thông tin tài khoản
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Text("Thông tin tài khoản",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 4),
                  Text(
                    "Cập nhật thông tin tài khoản",
                    style: AppTextStyles.bodyMedium(context)
                        .copyWith(color: Colors.grey),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel(context, "Tên"),
                      _buildCustomTextField(context, nameController,
                          hint: "tên"),
                      _buildLabel(context, "Email"),
                      _buildCustomTextField(context, emailController,
                          hint: "email"),
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

          ///Cập nhật mật khẩu
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Text("Cập nhật mật khẩu",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 4),
                  Text(
                    "Mật khẩu đã sử dụng lâu, thực hiện thay đổi để bảo mật tài khoản tốt hơn",
                    style: AppTextStyles.bodyMedium(context)
                        .copyWith(color: Colors.grey),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel(context, "Mật khẩu cũ"),
                      _buildCustomTextField(context, oldPassController,
                          hint: ""),
                      _buildLabel(context, "Mật khẩu mới"),
                      _buildCustomTextField(context, newPassController,
                          hint: ""),
                      _buildLabel(context, "Xác nhận lại mật khẩu mới"),
                      _buildCustomTextField(context, confirmPassController,
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

          ///Xác thực 2 bước
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text("Xác thực hai yếu tố",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 7),
                  Text(
                    "Thực hiện xác thực hai yếu tố để tăng tính bảo mật cho tài khoản của bạn",
                    style: AppTextStyles.bodyMedium(context)
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tài khoản chưa bật xác thực hai yếu tố",
                        style: AppTextStyles.titleMedium(context),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Cài ứng dụng Google Authenticator để nhận mã bảo mật ngẫu nhiên.",
                        style: AppTextStyles.bodyMedium(context),
                      ),
                      const SizedBox(height: 13),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlueColor),
                        child: Text(
                          "Bật xác thực",
                          style: AppTextStyles.buttonLabel(context),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          )),

          ///Xóa tài khoản
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text("Xóa tài khoản",
                        style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 4),
                    Text(
                      "Xóa tài khoản của bạn vĩnh viễn.",
                      style: AppTextStyles.bodyMedium(context)
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Sau khi tài khoản của bạn bị xóa, tất cả tài nguyên và dữ liệu của tài khoản đó sẽ bị xóa vĩnh viễn.",
                      style: AppTextStyles.bodyMedium(context),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor),
                      child: Text(
                        "Xóa tài khoản",
                        style: AppTextStyles.buttonLabel(context),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),

          ///Nơi đăng nhập
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text("Phiên đăng nhập trên trình duyệt",
                        style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 4),
                    Text(
                      "Quản lý và đăng xuất các phiên hoạt động của bạn trên các trình duyệt và thiết bị khác.",
                      style: AppTextStyles.bodyMedium(context)
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSessionItem(
                          context: context,
                          os: "Windows",
                          browser: "Chrome",
                          ip: "113.161.104.70",
                          lastActive: "1 phút trước",
                        ),
                        _buildSessionItem(
                          context: context,
                          os: "Windows",
                          browser: "Chrome",
                          ip: "14.254.19.65",
                          lastActive: "Đang sử dụng",
                          isCurrent: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightBlueColor),
                      onPressed: () {},
                      child: Text(
                        "Đăng xuất các phiên trình duyệt khác",
                        style: AppTextStyles.buttonLabel(context),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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

  Widget _buildSessionItem({
    required BuildContext context,
    required String os,
    required String browser,
    required String ip,
    required String lastActive,
    bool isCurrent = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.devices, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$os - $browser ($ip), Hoạt động gần nhất: $lastActive",
              style: AppTextStyles.bodySmall(context),
            ),
          ),
          if (isCurrent)
            Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
