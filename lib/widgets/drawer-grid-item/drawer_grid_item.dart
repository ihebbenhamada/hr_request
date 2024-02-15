import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

class DrawerGridItem extends StatelessWidget {
  const DrawerGridItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.onTap,
  });
  final String title;
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.h,
            clipBehavior: Clip.none,
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
              color: AppColors.blueDark,
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: iconHeight.h,
                width: iconWidth,
              ),
            ),
          ),
          2.h.verticalSpace,
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
