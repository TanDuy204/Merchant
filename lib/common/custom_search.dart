import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomSearch({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightTiny(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: AppDimensions.iconSmall(context),
              color: Colors.grey,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: TextField(
                controller: controller,
                style: AppTextStyles.bodySmall(context),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  hintText: 'Tìm kiếm...',
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.bodySmall(context)
                      .copyWith(color: Colors.grey),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
