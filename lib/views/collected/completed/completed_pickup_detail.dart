import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_format.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../controllers/point_controller.dart';

class CompletedPickupDetail extends StatefulWidget {
  const CompletedPickupDetail({super.key});

  @override
  State<CompletedPickupDetail> createState() => _CompletedPickupDetailState();
}

class _CompletedPickupDetailState extends State<CompletedPickupDetail> {
  final pointController = Get.find<PointController>();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchItemController = TextEditingController();

  int? pointId;

  @override
  void initState() {
    super.initState();
    pointId = Get.arguments;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pointController.loadScheduleDetail(pointId!);
    });
  }

  List<Map<String, dynamic>> get additionalCosts {
    final point = pointController.point.value;
    if (point?.additionalCosts == null) return [];

    return point!.additionalCosts!
        .map((cost) => {
              'name': cost.category ?? 'N/A',
              'quantity': cost.quantity ?? 0,
              'price': cost.unitPrice != null
                  ? FormatHelper.formatCurrency(cost.unitPrice!)
                  : '0',
              'total': cost.totalPrice != null
                  ? FormatHelper.formatCurrency(cost.totalPrice!)
                  : '0',
            })
        .toList();
  }

  List<Map<String, String>> get goods {
    final point = pointController.point.value;
    if (point?.goods == null) return [];

    return point!.goods!
        .map((item) => {
              'tenHangHoa': item.name ?? 'N/A',
              'kl': item.klGom?.toString() ?? '0',
              'id': item.deliveryPoint ?? 'N/A',
            })
        .toList();
  }

  List<String> get imageUrls {
    final point = pointController.point.value;
    return point?.images ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chi tiết lịch gom",
          style: AppTextStyles.titleMedium(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {},
            tooltip: 'Xem hợp đồng',
          ),
          IconButton(
            icon: const Icon(Icons.print_outlined),
            onPressed: () {},
            tooltip: 'In hợp đồng',
          ),
        ],
      ),
      body: Obx(() {
        if (pointController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final point = pointController.point.value;
        if (point == null) {
          return const Center(
            child: Text("Không có dữ liệu"),
          );
        }
        return CustomScrollView(
          slivers: [
            ///Thông tin chi tiết lịch gom
            SliverToBoxAdapter(
              child: BorderedContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin chi tiết",
                      style: AppTextStyles.titleMedium()),
                  const Divider(),
                  SizedBox(height: 7.h),
                  CustomInfoRow(
                      title: "Tên công ty:", value: point.companyName ?? 'N/A'),
                  SizedBox(height: 7.h),
                  CustomInfoRow(
                      title: "Địa chỉ gom:",
                      value: point.locationDetails ?? 'N/A'),
                  SizedBox(height: 7.h),
                  CustomInfoRow(title: "Khu vực:", value: point.area ?? 'N/A'),
                  SizedBox(height: 7.h),
                  CustomInfoRow(
                      title: "Tài xế:",
                      value:
                          "${point.driver!.name ?? 'N/A'} - ${point.driver!.phone ?? 'N/A'}"),
                  SizedBox(height: 7.h),
                  CustomInfoRow(
                      title: "Biển số xe:",
                      value: point.truck?.plateNumber ?? 'Chưa có')
                ],
              )),
            ),

            ///Tổng quan lịch gom
            SliverToBoxAdapter(
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tổng quan", style: AppTextStyles.titleMedium()),
                        CustomStatusBadge(
                            status: point.status ?? 'N/A', color: Colors.green)
                      ],
                    ),
                    SizedBox(height: 3.h),
                    const Divider(),
                    CustomInfoRow(
                        title: "Ngày gom:",
                        value: FormatHelper.formatDate(point.collectionDate!)),
                    SizedBox(height: 7.h),
                    CustomInfoRow(
                        title: "Loại hàng:", value: point.wasteType ?? 'N/A'),
                    SizedBox(height: 7.h),
                    CustomInfoRow(
                        title: "Khối lượng:",
                        value:
                            point.weight != null ? "${point.weight} Kg" : 'N/A',
                        isBold: true,
                        valueColor: AppColors.redColor),
                    SizedBox(height: 7.h),
                    CustomInfoRow(
                        title: "Tổng số tiền:",
                        value: FormatHelper.formatCurrency(
                            double.tryParse(point.totalPrice!) ?? 0),
                        isBold: true,
                        valueColor: AppColors.lightBlueColor),
                  ],
                ),
              ),
            ),

            ///Danh sách chi phí đi kèm
            SliverToBoxAdapter(
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Danh sách chi phí đi kèm",
                        style: AppTextStyles.titleMedium()),
                    const Divider(),
                    if (additionalCosts.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Không có chi phí đi kèm"),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final columnWidth = constraints.maxWidth / 4.5;
                          return DataTable(
                            headingTextStyle: AppTextStyles.titleSmall(),
                            dataTextStyle: AppTextStyles.bodySmall(),
                            columnSpacing: 0,
                            dataRowMinHeight: AppDimensions.heightTiny(),
                            dataRowMaxHeight: AppDimensions.heightSmall(),
                            columns: [
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth,
                                  child: const Text('Hạng mục'),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth,
                                  child: const Text('Số lượng'),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth,
                                  child: const Text('Đơn giá'),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth * 1.1,
                                  child: const Text('Thành tiền'),
                                ),
                              ),
                            ],
                            rows: additionalCosts.asMap().entries.map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              final isEven = index % 2 == 0;

                              return DataRow(
                                color: WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    return isEven
                                        ? Colors.grey[200]
                                        : Colors.white;
                                  },
                                ),
                                cells: [
                                  DataCell(SizedBox(
                                    width: columnWidth,
                                    child: Text(item['name']),
                                  )),
                                  DataCell(SizedBox(
                                    width: columnWidth,
                                    child: Text(item['quantity'].toString()),
                                  )),
                                  DataCell(SizedBox(
                                    width: columnWidth,
                                    child: Text('${item['price']}'),
                                  )),
                                  DataCell(SizedBox(
                                    width: columnWidth,
                                    child: Text('${item['total']}'),
                                  )),
                                ],
                              );
                            }).toList(),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),

            ///Danh sách hàng hóa
            SliverToBoxAdapter(
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Danh sách hàng hóa",
                        style: AppTextStyles.titleMedium()),
                    const Divider(),
                    if (goods.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Không có hàng hóa"),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final columnWidth = constraints.maxWidth / 4.5;
                          return DataTable(
                            headingTextStyle: AppTextStyles.titleSmall(),
                            dataTextStyle: AppTextStyles.bodySmall(),
                            columnSpacing: 0,
                            dataRowMaxHeight: AppDimensions.heightSmall(),
                            dataRowMinHeight: AppDimensions.heightTiny(),
                            columns: [
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth * 1.4,
                                  child: const Text('Tên'),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth * 1.2,
                                  child: const Text('KL GOM(KG)'),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: columnWidth * 1.5,
                                  child: const Text('Điểm giao'),
                                ),
                              ),
                            ],
                            rows: goods.asMap().entries.map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              final isEven = index % 2 == 0;
                              return DataRow(
                                color: WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    return isEven
                                        ? Colors.grey[200]
                                        : Colors.white;
                                  },
                                ),
                                cells: [
                                  DataCell(
                                    SizedBox(
                                      width: columnWidth * 1.4,
                                      child: Text(
                                        item['tenHangHoa']!,
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: columnWidth * 1.2,
                                      child: Center(child: Text(item['kl']!)),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                        width: columnWidth * 1.5,
                                        child: Text(item['id']!)),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),

            ///Hình ảnh đi kèm
            SliverToBoxAdapter(
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hình ảnh đi kèm", style: AppTextStyles.titleMedium()),
                    SizedBox(height: 7.h),
                    if (imageUrls.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Không có hình ảnh"),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: imageUrls.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    child: Image.network(
                                      imageUrls[index],
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text("Ảnh thu gom",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
