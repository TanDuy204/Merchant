import 'package:flutter/material.dart';
import 'package:merchant/common/styles.dart';

import '../../../service/uidata.dart';

class ContractDetailScreen extends StatefulWidget {
  const ContractDetailScreen({super.key});

  @override
  State<ContractDetailScreen> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
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
        title: const Text("Thông tin chi tiết"),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),

          ///Thông tin chi tiết
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thông tin chi tiết",
                  style: AppTextStyles.titleMedium(context)),
              _buildInfoCard(
                  context, "Tên công ty", "Công Ty TNHH Active Creation"),
              Row(
                children: [
                  Expanded(
                    child:
                        _buildInfoCard(context, "Ngày thu gom", "15-01-2025"),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildInfoCard(
                        context, "Thời gian thu gom", "16-01-2025"),
                  ),
                ],
              ),
              _buildInfoCard(context, "Ngày gửi lịch gom", "05-01-2025"),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(context, "Biển số xe", "50H-04282"),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildInfoCard(
                        context, "Tài xế phụ trách", "Nguyễn Minh Thái"),
                  ),
                ],
              ),
              _buildInfoCard(context, "Địa chỉ thu gom",
                  "359A, Ấp Long Bình, Xã Long Hiệp, Huyện Bến Lức, Tỉnh Long An"),
              _buildInfoCard(context, "Khu vực vận chuyển",
                  "Thủ Thừa (Long An) => Bình Tân (TP.HCM)"),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                        context, "Loại hàng", "Chất thải nguy hại"),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildInfoCard(
                        context, "Đơn giá vận chuyển", "2,400,000.00"),
                  ),
                ],
              ),
              _buildInfoCard(context, "Thông tin người liên hệ", "Chị Giao"),
              _buildInfoCard(context, "Trạng thái công nợ", "Chưa nghiệm thu"),
              const SizedBox(height: 10),
              Text("Danh sách chi phí đi kèm",
                  style: AppTextStyles.titleMedium(context)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'Tìm kiếm...',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    ///Danh sách chi phí đi kèm
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final columnWidth = constraints.maxWidth / 4.5;
                        return DataTable(
                          columnSpacing: 0,
                          dataRowHeight: 50,
                          columns: [
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('Hạng mục',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('Số lượng',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('Đơn giá',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('Thành tiền',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                          ],
                          rows: filteredData.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(SizedBox(
                                  width: columnWidth,
                                  child: Text(item['name'],
                                      style: AppTextStyles.bodySmall(context)),
                                )),
                                DataCell(SizedBox(
                                  width: columnWidth,
                                  child: Text(item['quantity'].toString(),
                                      style: AppTextStyles.bodySmall(context)),
                                )),
                                DataCell(SizedBox(
                                  width: columnWidth,
                                  child: Text('${item['price']}',
                                      style: AppTextStyles.bodySmall(context)),
                                )),
                                DataCell(SizedBox(
                                  width: columnWidth,
                                  child: Text('${item['total']}',
                                      style: AppTextStyles.bodySmall(context)),
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
              const SizedBox(height: 10),

              ///Danh sách hàng hóa
              Text("Danh sách hàng hóa",
                  style: AppTextStyles.titleMedium(context)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: searchItemController,
                              decoration: const InputDecoration(
                                hintText: 'Tìm kiếm hàng hóa...',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final columnWidth = constraints.maxWidth / 4.5;

                        return DataTable(
                          columnSpacing: 0,
                          dataRowHeight: 75,
                          columns: [
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('ID',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth * 2,
                                child: Text('Tên hàng hóa',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: columnWidth,
                                child: Text('KL GOM',
                                    style: AppTextStyles.titleSmall(context)),
                              ),
                            ),
                          ],
                          rows: filteredCollectedItems.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: columnWidth,
                                    child: Text(item['id']!,
                                        style:
                                            AppTextStyles.bodySmall(context)),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: columnWidth * 2,
                                    child: Text(
                                      item['tenHangHoa']!,
                                      style: AppTextStyles.bodySmall(context),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: columnWidth,
                                    child: Text(item['kl']!,
                                        style:
                                            AppTextStyles.bodySmall(context)),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoCard(BuildContext context, String title, String value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.titleSmall(context)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.bodyMedium(context)),
      ],
    ),
  );
}
