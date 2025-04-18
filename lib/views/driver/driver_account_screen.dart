import 'package:flutter/material.dart';
import 'package:merchant/common/app_style.dart';

class DriverAccountScreen extends StatelessWidget {
  const DriverAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drivers = [
      {
        'name': 'Tài xế 01',
        'phone': '0983163497',
        'gplx': '352283023562',
        'cccd': '352283023562',
        'address': '240/41 Lý Nam Dế, Huế',
        'status': 'Hoạt động',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách tài xế'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return DriverCard(
            name: driver['name']!,
            phone: driver['phone']!,
            gplx: driver['gplx']!,
            cccd: driver['cccd']!,
            address: driver['address']!,
            status: driver['status']!,
            onEdit: () {
              // TODO: Viết logic sửa
            },
            onDelete: () {
              // TODO: Viết logic xóa
            },
          );
        },
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String name;
  final String phone;
  final String gplx;
  final String cccd;
  final String address;
  final String status;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DriverCard({
    super.key,
    required this.name,
    required this.phone,
    required this.gplx,
    required this.cccd,
    required this.address,
    required this.status,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    name.substring(0, 2).toUpperCase(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: AppTextStyles.titleMedium(context),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildRow('SĐT:', phone, context),
            _buildRow('GPLX:', gplx, context),
            _buildRow('CCCD:', cccd, context),
            _buildRow('Địa chỉ:', address, context),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: status == 'Hoạt động'
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: status == 'Hoạt động' ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        '$label $value',
        style: AppTextStyles.bodyMedium(context),
      ),
    );
  }
}
