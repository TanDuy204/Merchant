import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/controllers/driver_controller.dart';
import 'package:merchant/views/driver/create_account_screen.dart';
import 'package:merchant/views/driver/edit_driver_screen.dart';

import '../../models/user.dart';

class DriverAccountScreen extends StatefulWidget {
  const DriverAccountScreen({super.key});

  @override
  State<DriverAccountScreen> createState() => _DriverAccountScreenState();
}

class _DriverAccountScreenState extends State<DriverAccountScreen> {
  final DriverController driverController = Get.find<DriverController>();

  String selectedValue = 'Tất cả';
  final List<String> statusTypes = [
    'Tất cả',
    'Hoạt động',
    'Tạm ngưng',
    'Khóa vĩnh viễn'
  ];

  String getFirstLetterOfLastName(String fullName) {
    if (fullName.trim().isEmpty) return '';
    List<String> parts = fullName.trim().split(' ');
    return parts.last[0].toUpperCase();
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Hoạt động":
        return Colors.green;
      case "Tạm ngưng":
        return Colors.orange;
      case "Khóa vĩnh viễn":
        return Colors.red;
      default:
        return AppColors.blueColor;
    }
  }

  List<User> getFilteredDrivers() {
    if (selectedValue == 'Tất cả') {
      return driverController.drivers;
    } else {
      return driverController.drivers
          .where((driver) => driver.status == selectedValue)
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      driverController.loadDrivers();
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
          "Danh sách tài xế",
          style: AppTextStyles.titleMedium(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(145.h),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Obx(() => BorderedContainer(
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
                                '${driverController.totalDrivers} Tài Xế',
                                style: AppTextStyles.titleXSmall(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
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
                      value: selectedValue,
                      items: statusTypes.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(
                            status,
                            style: AppTextStyles.bodyMedium(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
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
      body: Obx(() {
        if (driverController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final filteredDrivers = getFilteredDrivers();

        if (filteredDrivers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  size: 60,
                  color: Colors.grey.shade400,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Tất cả',
                  style: AppTextStyles.bodyMedium().copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: filteredDrivers.length,
                (context, index) {
                  final driver = filteredDrivers[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 0.h),
                    child: Slidable(
                      key: ValueKey(driver.id),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          CustomSlidableAction(
                            onPressed: (_) {
                              driverController.selectedDriver.value = driver;
                              Get.to(() => EditDriverScreen(driver: driver));
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
                              _showConfirmDialog(context, driver);
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
                                  color: getStatusColor(driver.status ?? ''),
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
                                  getFirstLetterOfLastName(driver.name ?? ''),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
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
                                        Text(driver.name ?? 'N/A',
                                            style: AppTextStyles.titleSmall()),
                                        const Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 3.h),
                                          decoration: BoxDecoration(
                                            color: getStatusColor(
                                                driver.status ?? ''),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            driver.status ?? '',
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
                                        Text(driver.phone ?? 'N/A',
                                            style: AppTextStyles.bodySmall()),
                                        SizedBox(width: 12.w),
                                        Icon(Icons.badge,
                                            size: 20.sp, color: Colors.grey),
                                        SizedBox(width: 4.w),
                                        Text(driver.soCCCD ?? 'N/A',
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
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateAccountScreen())?.then((_) {
            driverController.refresh();
          });
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

  void _showDriverDetails(BuildContext context, User driver) {
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
                  _buildDetailRow(
                      context, Icons.person, "Tên", driver.name ?? 'N/A'),
                  _buildDetailRow(
                      context, Icons.phone, "SĐT", driver.phone ?? 'N/A'),
                  _buildDetailRow(
                      context, Icons.email, "Email", driver.email ?? 'N/A'),
                  _buildDetailRow(
                      context, Icons.badge, "CCCD", driver.soCCCD ?? 'N/A'),
                  _buildDetailRow(context, Icons.car_rental, "GPLX",
                      driver.soGPLX ?? 'N/A'),
                  _buildDetailRow(
                      context, Icons.place, "Địa chỉ", driver.adress ?? 'N/A'),
                  _buildDetailRow(context, Icons.business, "Mã số thuế",
                      driver.masothue ?? 'N/A'),
                  _buildDetailRow(
                      context, Icons.info, "Trạng thái", driver.status ?? '')
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

  void _showConfirmDialog(BuildContext context, User driver) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Xoá tài khoản tài xế",
          style: AppTextStyles.titleMedium(),
        ),
        content: Text(
          "Bạn có chắc muốn xoá vĩnh viễn tài khoản của ${driver.name}?",
          style: AppTextStyles.bodyMedium(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("HUỶ"),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              Get.dialog(
                const Center(child: CircularProgressIndicator()),
                barrierDismissible: false,
              );
              bool success = await driverController.deleteDriver(driver.id!);
              Get.back();

              if (success) {
                Get.snackbar(
                  'Thành công',
                  'Đã xóa tài xế thành công',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              } else {
                Get.snackbar(
                  'Lỗi',
                  driverController.errorMessage.value.isNotEmpty
                      ? driverController.errorMessage.value
                      : 'Không thể xóa tài xế',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red),
            child: const Text("Xoá"),
          ),
        ],
      ),
    );
  }
}
