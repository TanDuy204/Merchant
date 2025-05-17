import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/models/schedule_model.dart';

class ScheduleScreen extends StatelessWidget {
  final List<Schedule> schedules;
  const ScheduleScreen({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Xếp lịch",
          style: AppTextStyles.titleMedium(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Lịch", style: AppTextStyles.titleMedium()),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: Text(
                      "Chọn lịch",
                      style: AppTextStyles.buttonLabel(),
                    ),
                  )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: schedules.length,
                  itemBuilder: (context, index) {
                    final schedule = schedules[index];
                    return Card(
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 7,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.radio_button_off,
                                        size: 25.sp, color: Colors.purple),
                                    const SizedBox(width: 8),
                                    Text(schedule.from,
                                        style: AppTextStyles.bodyMedium()),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 2),
                                          Container(
                                            height: 10.h,
                                            width: 3.w,
                                            color: Colors.grey.shade400,
                                          ),
                                          Icon(Icons.location_on,
                                              size: 25.sp, color: Colors.red),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      children: [
                                        const SizedBox(height: 19),
                                        Text(
                                          schedule.to,
                                          style: AppTextStyles.bodyMedium(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 28,
                                      child: Icon(Icons.receipt_long,
                                          size: 18, color: AppColors.blueColor),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        schedule.note,
                                        style: AppTextStyles.bodySmall(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(schedule.cargoType,
                                                style: AppTextStyles
                                                    .buttonLabel()),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${schedule.price}",
                                            style: AppTextStyles.bodyMedium(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        schedule.companyName,
                                        style: AppTextStyles.titleSmall(),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle),
                                            child: const Icon(Icons.phone,
                                                size: 14, color: Colors.white),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            schedule.contactName,
                                            style: AppTextStyles.bodyMedium()
                                                .copyWith(
                                                    color: AppColors.greyColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/collectSchedule',
                                        arguments: schedules);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      size: 14,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
