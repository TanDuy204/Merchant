import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/views/driver/create_account_screen.dart';
import 'package:merchant/views/driver/edit_diver_screen.dart';

import '../../common/sliver_header.dart';

class DriverAccountScreen extends StatefulWidget {
  const DriverAccountScreen({super.key});

  @override
  State<DriverAccountScreen> createState() => _DriverAccountScreenState();
}

class _DriverAccountScreenState extends State<DriverAccountScreen> {
  final List<Map<String, dynamic>> drivers = [
    {
      "name": "Tài xế 01",
      "phone": "0375441340",
      "license": "352283023562",
      "cccd": "352283023562",
      "initial": "T",
      "active": "Hoạt động",
      "address": "123 Đường A, Quận B, TP.HCM",
    },
    {
      "name": "Tài xế 02",
      "phone": "0912345678",
      "license": "123456789012",
      "cccd": "123456789012",
      "initial": "N",
      "active": "Tạm ngưng",
      "address": "456 Đường B, Quận C, TP.HCM",
    },
    {
      "name": "Tài xế 03",
      "phone": "0977654321",
      "license": "987654321098",
      "cccd": "987654321098",
      "initial": "H",
      "active": "Khóa vĩnh viễn",
      "address": "789 Đường C, Quận D, TP.HCM",
    },
  ];

  String selectedValue = 'Tất cả';
  final List<String> debtTypes = ['Hoạt động', 'Tạm ngưng', 'Khóa vĩnh viễn'];

  Color getStatusColor(String status) {
    switch (status) {
      case "Hoạt động":
        return Colors.green;
      case "Tạm ngưng":
        return Colors.orange;
      case "Khóa vĩnh viễn":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Danh sách tài xế",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SliverHeader(
              maxHeight: AppDimensions.heightSmallMedium(context),
              minHeight: AppDimensions.heightSmallMedium(context),
              child: Container(
                color: AppColors.whiteColor,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.greyColor, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Tất cả',
                          enabled: false,
                          child: Row(
                            children: [
                              Text('Tất cả',
                                  style: AppTextStyles.bodyLarge(context)),
                            ],
                          ),
                        ),
                        ...debtTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: AppTextStyles.bodyLarge(context)),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: drivers.length,
              (context, index) {
                final driver = drivers[index];
                return Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                  child: Slidable(
                    key: ValueKey(driver["phone"]),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        CustomSlidableAction(
                          onPressed: (_) {
                            Get.to(() => const EditDiverScreen());
                          },
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingSmall(context),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: AppDimensions.iconMedium(context),
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Sửa',
                                style:
                                    AppTextStyles.bodySmall(context).copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomSlidableAction(
                          onPressed: (_) {
                            _showConfirmDialog(context);
                          },
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingSmall(context),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                size: AppDimensions.iconMedium(context),
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Xoá',
                                style:
                                    AppTextStyles.bodySmall(context).copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => _showDriverDetails(context, driver),
                      child: BorderedContainer(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: AppDimensions.iconMedium(context),
                              backgroundColor: Colors.blue.shade100,
                              child: Text(
                                driver["initial"].toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        driver["name"],
                                        style:
                                            AppTextStyles.titleSmall(context),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppDimensions.paddingSmall(
                                                  context),
                                          vertical: AppDimensions.paddingXTiny(
                                              context),
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              getStatusColor(driver["active"]),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          driver["active"],
                                          style:
                                              AppTextStyles.bodySmall(context)
                                                  .copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                          size:
                                              AppDimensions.iconSmall(context)),
                                      const SizedBox(width: 4),
                                      Text(driver["phone"],
                                          style:
                                              AppTextStyles.bodySmall(context)),
                                      const SizedBox(width: 12),
                                      Icon(Icons.badge,
                                          size:
                                              AppDimensions.iconSmall(context)),
                                      const SizedBox(width: 4),
                                      Text(driver["cccd"],
                                          style:
                                              AppTextStyles.bodySmall(context)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateAccountScreen());
        },
        backgroundColor: AppColors.blueColor,
        child: Icon(
          Icons.add,
          size: AppDimensions.iconLarge(context),
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  void _showDriverDetails(BuildContext context, Map<String, dynamic> driver) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Thông tin tài xế',
                      style: AppTextStyles.titleMedium(context),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(context, Icons.person, "Tên", driver["name"]),
                  _buildDetailRow(context, Icons.phone, "SĐT", driver["phone"]),
                  _buildDetailRow(context, Icons.badge, "CCCD", driver["cccd"]),
                  _buildDetailRow(
                      context, Icons.car_rental, "GPLX", driver["license"]),
                  _buildDetailRow(
                      context, Icons.place, "Địa chỉ", driver["address"]),
                  _buildDetailRow(
                      context, Icons.info, "Trạng thái", driver["active"]),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,
              size: AppDimensions.iconMedium(context), color: Colors.blue),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: AppTextStyles.titleSmall(context),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium(context),
            ),
          ),
        ],
      ),
    );
  }
}

void _showConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Xoá tài khoản tài xế"),
      content:
          const Text("Bạn có chắc muốn xoá vĩnh viễn tài khoản tài xế này? "),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("HUỶ"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.red),
          child: const Text("Xoá"),
        ),
      ],
    ),
  );
}
