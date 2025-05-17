import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/views/driver/create_account_screen.dart';
import 'package:merchant/views/driver/edit_diver_screen.dart';

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
  final List<String> debtTypes = [
    'Tất cả',
    'Hoạt động',
    'Tạm ngưng',
    'Khóa vĩnh viễn'
  ];

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Danh sách tài xế",
          style: AppTextStyles.titleMedium(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(145.h),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                BorderedContainer(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tổng số tài xế',
                            style: AppTextStyles.bodyMedium().copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            '3 Tài Xế',
                            style: AppTextStyles.titleXSmall(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10.h, 0.h, 10.h, 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      value: 'Tất cả',
                      items: debtTypes.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(
                            status,
                            style: AppTextStyles.bodyMedium(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedValue = value!;
                      },
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: drivers.length,
              (context, index) {
                final driver = drivers[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 0.h),
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
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit,
                                  size: 28.sp, color: Colors.white),
                              const SizedBox(height: 4),
                              Text('Sửa',
                                  style: AppTextStyles.bodySmall()
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                        CustomSlidableAction(
                          onPressed: (_) {
                            _showConfirmDialog(context);
                          },
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete,
                                  size: 28.sp, color: Colors.white),
                              const SizedBox(height: 4),
                              Text('Xoá',
                                  style: AppTextStyles.bodySmall().copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => _showDriverDetails(context, driver),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: getStatusColor(driver["active"]),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            CircleAvatar(
                              radius: 25.r,
                              backgroundColor: Colors.blue.shade100,
                              child: Text(
                                driver["initial"].toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(driver["name"],
                                          style: AppTextStyles.titleSmall()),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 3.h),
                                        decoration: BoxDecoration(
                                          color:
                                              getStatusColor(driver["active"]),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Text(
                                          driver["active"],
                                          style: AppTextStyles.bodySmall()
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7.h),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                          size: 20.sp, color: Colors.grey),
                                      SizedBox(width: 4.w),
                                      Text(driver["phone"],
                                          style: AppTextStyles.bodySmall()),
                                      SizedBox(width: 12.w),
                                      Icon(Icons.badge,
                                          size: 20.sp, color: Colors.grey),
                                      SizedBox(width: 4.w),
                                      Text(driver["cccd"],
                                          style: AppTextStyles.bodySmall()),
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
          size: 32.sp,
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
                      style: AppTextStyles.titleMedium(),
                    ),
                  ),
                  const Divider(),
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
          Icon(icon, size: 25.sp, color: Colors.blue),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: AppTextStyles.titleSmall(),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium(),
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
