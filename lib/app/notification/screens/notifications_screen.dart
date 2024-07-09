import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/notification/controllers/notifications_controller.dart';
import 'package:request_hr/app/notification/model/notification.dart'
    as notifModel;
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/theme/theme_controller.dart';
import '../widget/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  final _notificationsController = Get.put(NotificationsController());
  final ThemeController themeController = Get.find();

  NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
          SizedBox(
            height: 40.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      margin: const EdgeInsets.only(left: 25),
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.back,
                          height: 20.h,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.h.verticalSpace,
          Obx(
            () => Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 30.h,
                  bottom: 50.h,
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  notifModel.Notification item =
                      _notificationsController.notificationList[index];
                  return NotificationItem(
                    image: null,
                    name: item.creatorName,
                    job: item.notificationText,
                    date: item.creationDate,
                    type: item.requestType,
                  );
                },
                separatorBuilder: (context, index) {
                  return 30.h.verticalSpace;
                },
                itemCount: _notificationsController.notificationList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
