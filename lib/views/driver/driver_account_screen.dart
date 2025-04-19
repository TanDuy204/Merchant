import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';

class DriverAccountScreen extends StatelessWidget {
  const DriverAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    String selectedValue = 'Tất cả';
    final List<String> debtTypes = ['Hoạt động', 'Tạm ngưng', 'Khóa vĩnh viễn'];

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
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  onChanged: (String? newValue) {},
                  items: [
                    const DropdownMenuItem<String>(
                      value: 'Tất cả',
                      child: Text('Tất cả'),
                    ),
                    ...debtTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }),
                  ],
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
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (_) => FractionallySizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text("Thông tin chi tiết",
                                      style: AppTextStyles.titleLarge(context)),
                                ),
                                const SizedBox(height: 20),
                                _buildDetailRow(context, Icons.person, "Tên",
                                    driver["name"]),
                                _buildDetailRow(context, Icons.phone, "SĐT",
                                    driver["phone"]),
                                _buildDetailRow(context, Icons.badge, "CCCD",
                                    driver["cccd"]),
                                _buildDetailRow(context, Icons.card_membership,
                                    "GPLX", driver["license"]),
                                _buildDetailRow(context, Icons.location_on,
                                    "Địa chỉ", driver["address"]),
                                _buildDetailRow(context, Icons.verified_user,
                                    "Trạng thái", driver["active"]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
                                    Text(driver["name"],
                                        style:
                                            AppTextStyles.titleSmall(context)),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.paddingSmall(context),
                                        vertical:
                                            AppDimensions.paddingXTiny(context),
                                      ),
                                      decoration: BoxDecoration(
                                        color: getStatusColor(driver["active"]),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        driver["active"],
                                        style: AppTextStyles.bodySmall(context)
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.phone,
                                        size: AppDimensions.iconSmall(context)),
                                    const SizedBox(width: 4),
                                    Text(driver["phone"],
                                        style:
                                            AppTextStyles.bodySmall(context)),
                                    const SizedBox(width: 12),
                                    Icon(Icons.badge,
                                        size: AppDimensions.iconSmall(context)),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDetailRow(
    BuildContext context, IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppDimensions.iconMedium(context), color: Colors.blue),
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
