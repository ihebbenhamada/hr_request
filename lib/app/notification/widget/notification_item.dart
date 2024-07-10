import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.image,
    required this.name,
    required this.job,
    required this.date,
    required this.type,
  });

  final String? image;
  final String name;
  final String job;
  final String date;
  final int type;
  //1:evaluation / 13:meeting / 3:punishment / 4:Bonus / 5:decision / 6:Alert

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 11.h,
            bottom: 11.h,
            left: Get.locale?.languageCode == 'en' ? 25 : 10,
            right: Get.locale?.languageCode == 'ar' ? 25 : 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 3,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTitle(type),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.gray1,
                ),
              ),
              Text(
                '$name / $job',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.blueDark,
                ),
              ),
              7.h.verticalSpace,
              Container(
                width: 85,
                padding: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: type == 3 || type == 5
                      ? AppColors.redLight
                      : AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    DateFormat("ddMMM - HH:mm").format(DateTime.parse(date)),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: Get.locale?.languageCode == 'en' ? 28 : null,
          left: Get.locale?.languageCode == 'ar' ? 28 : null,
          top: -24.h,
          child: Container(
            width: 48.h,
            height: 48.h,
            decoration: ShapeDecoration(
              color: type == 3 || type == 5
                  ? AppColors.redLight
                  : AppColors.primary,
              shape: OvalBorder(
                side: BorderSide(
                  color: AppColors.gray2,
                  width: 3.h,
                ),
              ),
            ),
            child: Center(
              child: imageCircle(type),
            ),
          ),
        )
      ],
    );
  }

  Widget imageCircle(int type) {
    switch (type) {
      case 1:
        return Image.asset(image!);
      case 13:
        return Image.asset(AppImages.meetings, height: 22.4.h);
      case 3:
        return Image.asset(AppImages.punishmentsDrawer, height: 23.5.h);
      case 4:
        return Image.asset(AppImages.bonusDrawer, height: 21.8.h);
      case 5:
        return Image.asset(AppImages.decisions, height: 25.7.h);
      case 6:
        return Image.asset(AppImages.ticketMenuDrawer, height: 14.h);
      case 11:
        return Image.asset(AppImages.loanDrawer, height: 19.h);
      case 14:
        return Image.asset(AppImages.evaluationsDrawer, height: 19.h);
      default:
        return Image.asset(AppImages.meetings, height: 22.4.h);
    }
  }

  String getTitle(int type) {
    switch (type) {
      case 1:
        return "";
      case 13:
        return "New Meeting !";
      case 3:
        return "New Punishment !";
      case 4:
        return "New Bonus !";
      case 5:
        return "New Decision !";
      case 6:
        return "New Ticket !";
      case 11:
        return "New Loan !";
      case 14:
        return "New Evaluation !";
      default:
        return "No title";
    }
  }
}
