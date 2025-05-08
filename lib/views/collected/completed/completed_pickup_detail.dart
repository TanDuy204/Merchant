import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/custom_search.dart';
import '../../../service/uidata.dart';

class CompletedPickupDetail extends StatefulWidget {
  const CompletedPickupDetail({super.key});

  @override
  State<CompletedPickupDetail> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<CompletedPickupDetail> {
  final List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchItemController = TextEditingController();

  List<Map<String, dynamic>> get filteredData {
    String query = searchController.text.toLowerCase();
    return allData.where((row) {
      return row.values
          .any((value) => value.toString().toLowerCase().contains(query));
    }).toList();
  }

  List<Map<String, String>> get filteredCollectedItems {
    final query = searchItemController.text.toLowerCase();
    return collectedItems.where((item) {
      return item.values.any((value) => value.toLowerCase().contains(query));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chi tiết lịch gom",
          style: AppTextStyles.titleMedium(context),
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
      body: CustomScrollView(
        slivers: [
          ///Thông tin chi tiết lịch gom
          SliverToBoxAdapter(
            child: BorderedContainer(
                margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thông tin chi tiết",
                        style: AppTextStyles.titleMedium(context)),
                    const Divider(
                      height: 1,
                    ),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        useExpanded: true,
                        title: "Tên công ty:",
                        value: "Công Ty TNHH Active Creation "),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        useExpanded: true,
                        title: "Địa chỉ gom:",
                        value: "Khu công nghiệp Quang Minh, Hà Nội"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        useExpanded: true, title: "Khu vực:", value: "Hà Nội"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        useExpanded: true,
                        title: "Tài xế:",
                        value: "Tài Xe1 - 0935355355"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        useExpanded: true,
                        title: "Biển số xe:",
                        value: "29H1-123-Huydai-123")
                  ],
                )),
          ),

          ///Tổng quan lịch gom
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tổng quan", style: AppTextStyles.titleMedium(context)),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trạng thái:",
                          style: AppTextStyles.bodyMedium(context)),
                      const CustomStatusBadge(
                          status: "Đã sắp", color: Colors.green)
                    ],
                  ),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(title: "Ngày gom:", value: "20/05/2025"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: "Loại hàng:", value: "Chất thải công nghiệp"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: "Khối lượng:",
                      value: "4500 Kg",
                      isBold: true,
                      valueColor: AppColors.redColor),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: "Tổng số tiền:",
                      value: "35.000.000 VND",
                      isBold: true,
                      valueColor: AppColors.lightBlueColor),
                ],
              ),
            ),
          ),

          ///Danh sách chi phí đi kèm
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Danh sách chi phí đi kèm",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 10),

                  ///Widget search
                  CustomSearch(
                    controller: searchController,
                    onChanged: (value) => setState(() {}),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columnWidth = constraints.maxWidth / 4.5;
                      return DataTable(
                        headingTextStyle: AppTextStyles.titleSmall(context),
                        dataTextStyle: AppTextStyles.bodySmall(context),
                        columnSpacing: 0,
                        dataRowMinHeight: AppDimensions.heightTiny(context),
                        dataRowMaxHeight: AppDimensions.heightSmall(context),
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
                        rows: filteredData.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          final isEven = index % 2 == 0;

                          return DataRow(
                            color: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                return isEven ? Colors.grey[200] : Colors.white;
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
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Danh sách hàng hóa",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 10),

                  ///Widget search
                  CustomSearch(
                    controller: searchItemController,
                    onChanged: (value) => setState(() {}),
                  ),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columnWidth = constraints.maxWidth / 4.5;
                      return DataTable(
                        headingTextStyle: AppTextStyles.titleSmall(context),
                        dataTextStyle: AppTextStyles.bodySmall(context),
                        columnSpacing: 0,
                        dataRowMaxHeight: AppDimensions.heightSmall(context),
                        dataRowMinHeight: AppDimensions.heightTiny(context),
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
                        rows:
                            filteredCollectedItems.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          final isEven = index % 2 == 0;
                          return DataRow(
                            color: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                return isEven ? Colors.grey[200] : Colors.white;
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

          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hình ảnh đi kèm",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 8),
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
                                  errorBuilder: (context, error, stackTrace) =>
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
      ),
    );
  }
}
