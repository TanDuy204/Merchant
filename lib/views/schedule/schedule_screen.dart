import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/styles.dart';
import 'package:merchant/models/schedule_model.dart';
import 'package:merchant/routes/app_route.dart';

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
          style: AppTextStyles.titleMedium(context),
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
                  Text("Lịch", style: AppTextStyles.titleMedium(context)),
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
                      style: AppTextStyles.buttonLabel(context),
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.radio_button_checked,
                                        size: 27, color: Colors.purple),
                                    const SizedBox(width: 8),
                                    Text(schedule.from,
                                        style:
                                            AppTextStyles.bodyMedium(context)),
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
                                            height: 16,
                                            width: 2,
                                            color: Colors.grey.shade400,
                                          ),
                                          const Icon(Icons.location_on,
                                              size: 25, color: Colors.red),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      children: [
                                        const SizedBox(height: 19),
                                        Text(
                                          schedule.to,
                                          style:
                                              AppTextStyles.bodyMedium(context),
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
                                        style: AppTextStyles.bodySmall(context),
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
                                                style:
                                                    AppTextStyles.buttonLabel(
                                                        context)),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${schedule.price}",
                                            style: AppTextStyles.bodyMedium(
                                                context),
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
                                        style:
                                            AppTextStyles.titleSmall(context),
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
                                            style: AppTextStyles.bodyMedium(
                                                    context)
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
                                    Get.toNamed(AppRoutes.collectSchedule,
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
