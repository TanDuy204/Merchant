import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/models/schedule_model.dart';

import '../../common/styles.dart';

class CollectionScheduleScreen extends StatelessWidget {
  const CollectionScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Schedule> schedules = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Sắp lịch gom",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: AppColors.lightBlue,
            height: 50,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/info_icon.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text("Danh sách lịch gom chưa sắp trong ngày")
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: schedules.length,
                  itemBuilder: (context, index) {
                    final task = schedules[index];
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(task.datetime);
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icons/car_icon.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 8),
                              Text("Chuyến thu gom",
                                  style: AppTextStyles.titleSmall(context)),
                              const Spacer(),
                              Text("CTG_22223",
                                  style: AppTextStyles.titleSmall(context)),
                            ],
                          ),
                          const Divider(),
                          _list(context, "Tuyến:", "${task.to}=>${task.from}",
                              task),
                          const SizedBox(height: 8),
                          _list(context, "Loại hàng:", task.cargoType, task),
                          const SizedBox(height: 8),
                          _list(context, "Ngày gom hàng:", formattedDate, task),
                          const SizedBox(height: 8),
                          _list(context, "Đơn giá:", "${task.price}", task),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Color(0xFF79747E),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text("Chi tiết",
                                      style: AppTextStyles.buttonLabel(context)
                                          .copyWith(
                                              color: AppColors.greyColor)),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: AppColors.blueColor,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text("Sắp lịch",
                                      style: AppTextStyles.buttonLabel(context)
                                          .copyWith(
                                              color: AppColors.blueColor)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

Widget _list(
    BuildContext context, String text1, dynamic text2, Schedule schedule) {
  String formattedText = text1 == "Đơn giá:"
      ? NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
          .format(text2 is num ? text2 : double.tryParse(text2.toString()))
      : text2.toString();

  return Row(
    children: [
      Text(
        text1,
        style: text1 == "Đơn giá:"
            ? AppTextStyles.titleSmall(context)
            : AppTextStyles.bodyMedium(context),
      ),
      const Spacer(),
      Text(
        formattedText,
        style: text1 == "Đơn giá:"
            ? AppTextStyles.titleSmall(context)
            : AppTextStyles.bodyMedium(context),
      ),
    ],
  );
}
