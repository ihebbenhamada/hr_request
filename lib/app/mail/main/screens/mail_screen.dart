import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/email-item/email_item.dart';

import '../../../../../config/theme/theme_controller.dart';
import '../controllers/mail_controller.dart';

class MailScreen extends StatelessWidget {
  final _mailController = Get.put(MailController());
  final ThemeController themeController = Get.find();
  final DashboardController _dashboardController = Get.find();
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();

  MailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            backgroundColor: AppColors.gray2,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
                GestureDetector(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 25.0,
                      left: 25.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Create Mail',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: _mailController.onClickCreateEmail,
                              child: Image.asset(
                                AppImages.addDecision,
                                height: 34.h,
                                width: 34.h,
                              ),
                            )
                          ],
                        ),
                        20.h.verticalSpace,
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 80.h),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> item =
                                  _mailController.listMails[index];
                              return EmailItem(
                                  isSelected: item['is_selected'],
                                  image: item['image'],
                                  subject: item['subject'],
                                  sender: item['sender'],
                                  description: item['description'],
                                  date: item['date'],
                                  onClickItem: _mailController.onItemSelected);
                            },
                            separatorBuilder: (context, index) {
                              return 16.h.verticalSpace;
                            },
                            itemCount: _mailController.listMails.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -15.h,
                  child: Image.asset(
                    AppImages.innTechLogo,
                    height: 40.h,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Platform.isIOS ? 50.h : 64.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.bottomNavigationShape),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _mailController.onClickMenuMail(context),
                              child: Image.asset(
                                AppImages.menuEmail,
                                height: 6.h,
                              ),
                            ),
                            40.horizontalSpace,
                            Image.asset(
                              AppImages.refreshEmail,
                              height: 24.h,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.replayEmail,
                              height: 24.h,
                            ),
                            40.horizontalSpace,
                            GestureDetector(
                              onTap: () =>
                                  _mailController.onClickSearch(context),
                              child: Image.asset(
                                AppImages.searchMail,
                                height: 24.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        ),
      ),
    );
  }
}
