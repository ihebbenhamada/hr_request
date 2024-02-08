import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onClickProfile,
    required this.onClickMessage,
    required this.onClickNotification,
    required this.onClickMenu,
  });
  final void Function() onClickProfile;
  final void Function() onClickMessage;
  final void Function() onClickNotification;
  final void Function() onClickMenu;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 25,
        right: 25,
        bottom: 17.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClickProfile,
            child: Row(
              children: [
                Container(
                  width: 40.h,
                  height: 40.h,
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
                    color: AppColors.blueDark,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onClickMessage,
                child: Image.asset(
                  AppImages.message,
                  height: 23.h,
                ),
              ),
              12.horizontalSpace,
              GestureDetector(
                onTap: onClickNotification,
                child: Image.asset(
                  AppImages.notification,
                  height: 23.h,
                ),
              ),
              12.horizontalSpace,
              GestureDetector(
                onTap: onClickMenu,
                child: Image.asset(
                  AppImages.menu,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
