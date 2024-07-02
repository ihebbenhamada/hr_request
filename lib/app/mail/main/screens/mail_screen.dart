import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/mail/main/model/mail.dart';
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
                        GetBuilder<MailController>(
                          builder: (_) => Expanded(
                            child: RefreshIndicator(
                              onRefresh: _mailController.handleRefresh,
                              color: AppColors.white,
                              backgroundColor: AppColors.primary,
                              child: ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 80.h),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  Mail item = _mailController.mailList[index];
                                  return EmailItem(
                                    isSelected: item.isSelected,
                                    image: item.filePath ?? "",
                                    subject: item.subject ?? "",
                                    sender: item.senderName ?? "",
                                    description: item.description ?? "",
                                    date: item.creationDate?.substring(0, 10) ??
                                        "",
                                    onClickItem: () => _mailController
                                        .onClickMail(mail: item, from: "list"),
                                    onSelectMail: () =>
                                        _mailController.onSelectMail(index),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return 16.h.verticalSpace;
                                },
                                itemCount: _mailController.mailList.length,
                              ),
                            ),
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
                              child: Container(
                                height: 20,
                                color: AppColors.primary,
                                child: Center(
                                  child: Image.asset(
                                    AppImages.menuEmail,
                                    height: 6.h,
                                  ),
                                ),
                              ),
                            ),
                            40.horizontalSpace,
                            GestureDetector(
                              onTap: _mailController.handleRefresh,
                              child: Image.asset(
                                AppImages.refreshEmail,
                                height: 24.h,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _mailController.replayEmail,
                              child: Image.asset(
                                AppImages.replayEmail,
                                height: 24.h,
                              ),
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
