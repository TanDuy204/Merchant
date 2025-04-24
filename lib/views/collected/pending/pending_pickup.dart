import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/models/pending_schedule_model.dart';

import '../../../common/custom_datapicker.dart';

class PendingPickupScreen extends StatefulWidget {
  final List<PendingScheduleModel> pendingSchedule;

  const PendingPickupScreen({super.key, required this.pendingSchedule});

  @override
  State<PendingPickupScreen> createState() => _PendingPickupScreenState();
}

class _PendingPickupScreenState extends State<PendingPickupScreen> {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;
  final List<Map<String, String>> mockData = [
    {
      "Tên công ty": "TNHH Jones Lang Lasalle (Việt Nam)",
      "Địa điểm": "Khu công nghiệp Long Biên, Hà Nội",
      "Người liên hệ": "Trống",
      "Số lượng": "Trống",
    },
    {
      "Tên công ty": "Công ty TNHH ABC",
      "Địa điểm": "Khu công nghiệp Phố Nối, Hưng Yên",
      "Người liên hệ": "Nguyễn Văn A",
      "Số lượng": "10",
    },
    {
      "Tên công ty": "Công ty XYZ",
      "Địa điểm": "Khu công nghiệp Bình Dương",
      "Người liên hệ": "Trần Thị B",
      "Số lượng": "5",
    },
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    fromDate = now.subtract(const Duration(days: 30));
    toDate = now;

    final formatter = DateFormat('dd/MM/yyyy');
    fromDateController.text = formatter.format(fromDate!);
    toDateController.text = formatter.format(toDate!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BorderedContainer(
              child: Row(
                children: [
                  Expanded(
                    child: CustomDatePickerField(
                      label: "Từ Ngày:",
                      controller: fromDateController,
                      initialDate: fromDate,
                      lastDate: toDate,
                      onDatePicked: (picked) {
                        setState(() {
                          fromDate = picked;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDatePickerField(
                      label: "Đến Ngày:",
                      controller: toDateController,
                      initialDate: toDate,
                      firstDate: fromDate,
                      onDatePicked: (picked) {
                        setState(() {
                          toDate = picked;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Danh sách chuyến thu gom chưa sắp:',
              style: AppTextStyles.titleMedium(context),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) {
              return Accordion(
                contentBorderColor: Colors.transparent,
                rightIcon: const SizedBox.shrink(),
                maxOpenSections: 1,
                paddingListBottom: 0,
                paddingListTop: 0,
                headerPadding: EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingMedium(context),
                  horizontal: AppDimensions.paddingSmall(context),
                ),
                headerBackgroundColorOpened: AppColors.lightBlue,
                headerBackgroundColor: Colors.white,
                children: [
                  AccordionSection(
                    isOpen: false,
                    header: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: AppDimensions.iconSmall(context),
                                    color: AppColors.blueColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text('25/07/2025',
                                      style: AppTextStyles.titleSmall(context)),
                                ],
                              ),
                              Text(
                                'Chất thải công nghiệp',
                                style: AppTextStyles.titleSmall(context),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(' 172512.21 Kg',
                                      style: AppTextStyles.titleSmall(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: AppDimensions.iconSmall(context),
                                    color: AppColors.blueColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '1 Nhân công',
                                    style: AppTextStyles.titleSmall(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: mockData.map((company) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailRowH(context, "Tên công ty:",
                                company["Tên công ty"]!),
                            _detailRowH(
                                context, "Địa điểm:", company["Địa điểm"]!),
                            _detailRowH(
                                context, "Khối lượng:", company["Số lượng"]!),
                            const Divider(),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

Widget _detailRowH(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodySmall(context),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTextStyles.titleSmall(context),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  );
}
