import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class BonusPunishmentsCategoryItem extends StatelessWidget {
  const BonusPunishmentsCategoryItem({
    super.key,
    required this.onSelectBonusPunishment,
    required this.index,
    required this.selectedBonusPunishments,
    required this.title,
    required this.isNew,
  });
  final void Function() onSelectBonusPunishment;
  final int index;
  final int selectedBonusPunishments;
  final String title;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectBonusPunishment,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 27.h,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: selectedBonusPunishments == index
                  ? AppColors.primary
                  : AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ), // Customize the color
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: selectedBonusPunishments == index
                      ? AppColors.white
                      : AppColors.blueDark,
                ),
              ),
            ),
          ),
          isNew == true
              ? Positioned(
                  right: 5,
                  child: Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.redLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
