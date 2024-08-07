import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_info_container.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_official_info_container.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';
import 'package:request_hr/widgets/official-vacation-item/official_vacation_item.dart';
import 'package:request_hr/widgets/vacation-item/vacation_item.dart';

class VacationsScreen extends StatelessWidget {
  final _vacationsController = Get.put(VacationsController());
  final ThemeController _themeController = Get.find();
  VacationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 25.0, right: 25, bottom: Platform.isIOS ? 50.h : 64.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'create'.tr}\n${'new_vacation'.tr}',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: _vacationsController.navigateAndRefresh,
                child: Image.asset(
                  AppImages.addDecision,
                  height: 34.h,
                  width: 34.h,
                ),
              )
            ],
          ),
          16.h.verticalSpace,
          CategoriesFilter(
            selectedFilter: _vacationsController.selectedFilter,
            onSelectFilter: (int index) =>
                _vacationsController.onSelectFilter(index),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _vacationsController.handleRefresh,
              color: AppColors.white,
              backgroundColor: AppColors.primary,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.h.verticalSpace,
                        Obx(
                          () => _vacationsController.vacationsList.isNotEmpty
                              ? CarouselSlider.builder(
                                  itemCount: _vacationsController
                                          .vacationsList.length +
                                      1,
                                  itemBuilder: (context, index, i) {
                                    if (index ==
                                        _vacationsController
                                            .vacationsList.length) {
                                      // Display fake item at the last index
                                      return const SizedBox();
                                    }
                                    Vacation item = _vacationsController
                                        .vacationsList[index];
                                    return VacationItem(
                                      title: Get.locale?.languageCode == 'en'
                                          ? "${item.vacationTypeNameEn}\n${'vacation'.tr}"
                                          : "${'vacation'.tr}\n${item.vacationTypeNameAr}",
                                      startDate: item.dateFrom.substring(0, 10),
                                      endDate: item.dateTo.substring(0, 10),
                                      icon: item.icon,
                                      withAlert: item.withAlert,
                                      color: item.color,
                                      iconHeight: item.iconHeight,
                                      onClick: () => _vacationsController
                                          .onClickVacationItem(item.vacationId),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 182.h,
                                    animateToClosest: true,
                                    viewportFraction: 0.43,
                                    initialPage: 0,
                                    clipBehavior: Clip.none,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    autoPlay: false,
                                    enlargeCenterPage: false,
                                    padEnds: false,
                                    pageSnapping: false,
                                    onPageChanged: (index, reason) =>
                                        _vacationsController
                                            .onChangeVacationList(
                                                index, reason),
                                    scrollDirection: Axis.horizontal,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'no_vacation_found'.tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                        ),
                        14.h.verticalSpace,
                        Obx(
                          () => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: CustomDotsIndicator(
                              length: _vacationsController.vacationsList.length,
                              current: _vacationsController
                                  .currentVacationIndex.value,
                            ),
                          ),
                        ),
                        13.h.verticalSpace,
                        VacationInfoContainer(
                          vacationPercentage:
                              _vacationsController.vacationPercentage,
                          takenDays: _vacationsController.takenDays,
                          leftDays: _vacationsController.leftDays,
                        ),
                        22.h.verticalSpace,
                        VacationOfficialInfoContainer(
                          nextVacation: _vacationsController.nextVacation,
                        ),
                        22.h.verticalSpace,
                        CarouselSlider.builder(
                          itemCount:
                              _vacationsController.officialVacationList.length +
                                  1,
                          itemBuilder: (context, index, i) {
                            if (index ==
                                _vacationsController
                                    .officialVacationList.length) {
                              // Display fake item at the last index
                              return const SizedBox();
                            }
                            Map<String, dynamic> item = _vacationsController
                                .officialVacationList[index];

                            return OfficialVacationItem(
                              title: item['title'],
                              date: item['date'],
                            );
                          },
                          options: CarouselOptions(
                            height: 70.h,
                            clipBehavior: Clip.none,
                            animateToClosest: true,
                            viewportFraction: 0.6,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            padEnds: false,
                            pageSnapping: false,
                            onPageChanged: (index, reason) =>
                                _vacationsController
                                    .onChangeOfficialVacationList(
                                        index, reason),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () => CustomDotsIndicator(
                            length: _vacationsController
                                .officialVacationList.length,
                            current: _vacationsController
                                .currentOfficialVacationIndex.value,
                          ),
                        ),
                        20.h.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
