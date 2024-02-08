import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    super.key,
    required this.closeDrawer,
  });
  final void Function() closeDrawer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 54.h,
                height: 54.h,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.profile),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF707070)),
                  ),
                ),
              ),
              6.horizontalSpace,
              Text(
                'Mohamed.,\nSenior front end developer',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: closeDrawer,
            child: Container(
              height: 38.h,
              width: 38.h,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                color: AppColors.white,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.back,
                  height: 21.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
