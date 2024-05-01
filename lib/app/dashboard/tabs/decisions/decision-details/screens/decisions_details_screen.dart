import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/widgets/desicion-details-container.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/main/model/get_decisions_response.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../../config/image_urls/image_urls.dart';
import '../controllers/decisions_details_controller.dart';

class DecisionsDetailsScreen extends StatelessWidget {
  final _decisionsDetailsController = Get.put(DecisionsDetailsController());
  DecisionsDetailsScreen({super.key, this.decisionsResponse});
  final DecisionsResponse? decisionsResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: SizedBox(
              height: 111.h,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: 360.w,
                    height: 80.h,
                    padding: const EdgeInsets.only(left: 25),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      image: DecorationImage(
                        image: AssetImage(AppImages.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.h),
                                border: Border.all(color: AppColors.blue1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.employee,
                                  height: 12.5.h,
                                  width: 12,
                                ),
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              'Mohamed Ismail ',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        5.h.verticalSpace,
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.h),
                                border: Border.all(color: AppColors.blue1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.position,
                                  height: 10.7.h,
                                  width: 13.3,
                                ),
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              'project Manager',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        5.h.verticalSpace,
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.h),
                                border: Border.all(color: AppColors.blue1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.cal,
                                  height: 8.h,
                                  width: 8.h,
                                ),
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              '19/5/2024',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: AvatarCircle(
                      image: AppImages.avatar3,
                      size: 112.h,
                      iconSize: 22.h,
                      imageSize: 95.h,
                      left: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          60.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                DecisionDetailsInput(
                  icon: AppImages.title,
                  controller: decisionsResponse?.subject == null
                      ? _decisionsDetailsController.subjectTextEditingController
                      : null,
                  nbrLines: 1,
                  paddingRight: 50,
                  enabled: decisionsResponse?.subject != null ? false : true,
                  initialValue: decisionsResponse?.subject,
                  hint: 'Subject',
                ),
                40.h.verticalSpace,
                DecisionDetailsInput(
                  icon: AppImages.description,
                  paddingTop: 20.h,
                  paddingBottom: 20.h,
                  controller: decisionsResponse?.creationDate == null
                      ? _decisionsDetailsController
                          .descriptionTextEditingController
                      : null,
                  initialValue: decisionsResponse?.creationDate,
                  enabled: decisionsResponse?.subject != null ? false : true,
                  nbrLines: 13,
                  hint: 'Description',
                ),
                30.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    decisionsResponse == null
                        ? GestureDetector(
                            onTap: _decisionsDetailsController.onClickDone,
                            child: Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: const ShapeDecoration(
                                color: AppColors.primary,
                                shape: OvalBorder(),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.tick,
                                  color: AppColors.white,
                                  height: 30.h,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    23.horizontalSpace,
                    GestureDetector(
                      onTap: _decisionsDetailsController.onClickBack,
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.blueDark,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.x,
                            color: AppColors.white,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
