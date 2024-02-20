import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class PurchaseNameItem extends StatelessWidget {
  const PurchaseNameItem({
    super.key,
    required this.name,
    required this.index,
    required this.deleteName,
  });

  final String name;
  final int index;
  final void Function(int) deleteName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      padding: const EdgeInsets.only(
        left: 15,
        right: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 3,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blueDark,
            ),
          ),
          GestureDetector(
            onTap: () => deleteName(index),
            child: Container(
              height: 32.h,
              width: 32.h,
              decoration: const ShapeDecoration(
                color: AppColors.gray2,
                shape: OvalBorder(),
              ),
              child: Center(
                child: Image.asset(
                  AppImages.x,
                  height: 13.h,
                  color: AppColors.blueDark,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
