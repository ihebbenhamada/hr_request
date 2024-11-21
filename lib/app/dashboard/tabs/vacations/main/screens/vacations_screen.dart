import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
        bottom: Platform.isIOS ? 50.h : 64.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !GetStorage().read('isChairman')
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25,
                  ),
                  child: Row(
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
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25,
                  ),
                  child: Text(
                    'employees_vacations'.tr,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
          16.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25,
            ),
            child: CategoriesFilter(
              selectedFilter: _vacationsController.selectedFilter,
              onSelectFilter: (int index) =>
                  _vacationsController.onSelectFilter(index),
            ),
          ),
          10.h.verticalSpace,
          Expanded(
            child: RefreshIndicator(
              onRefresh: _vacationsController.handleRefresh,
              color: AppColors.white,
              backgroundColor: AppColors.primary,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: GestureDetector(
                        onTap: _vacationsController.handleShowAll,
                        child: Align(
                          alignment: Get.locale?.languageCode == 'en'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            'Show All',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.blueDark,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    7.h.verticalSpace,
                    Obx(
                      () => _vacationsController.vacationsList.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 25,
                              ),
                              child: CarouselSlider.builder(
                                itemCount:
                                    _vacationsController.vacationsList.length >
                                            5
                                        ? 5
                                        : _vacationsController
                                                .vacationsList.length +
                                            1,
                                itemBuilder: (context, index, i) {
                                  if ((_vacationsController
                                                  .vacationsList.length >
                                              5 &&
                                          index == 5) ||
                                      index ==
                                          _vacationsController
                                              .vacationsList.length) {
                                    return const SizedBox();
                                  }
                                  Vacation item =
                                      _vacationsController.vacationsList[index];
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
                                    marginLeft: Get.locale?.languageCode == 'ar'
                                        ? 15.0
                                        : null,
                                    marginRight:
                                        Get.locale?.languageCode == 'en'
                                            ? 15.0
                                            : null,
                                    onClick: () => _vacationsController
                                        .onClickVacationItem(item.vacationId),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 182.h,
                                  animateToClosest: true,
                                  viewportFraction: 0.39,
                                  initialPage: 0,
                                  clipBehavior: Clip.none,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  enlargeCenterPage: false,
                                  padEnds: false,
                                  pageSnapping: false,
                                  onPageChanged: (index, reason) =>
                                      _vacationsController.onChangeVacationList(
                                          index, reason),
                                  scrollDirection: Axis.horizontal,
                                ),
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
                      () => CustomDotsIndicator(
                        length: _vacationsController.vacationsList.length > 5
                            ? 5
                            : _vacationsController.vacationsList.length,
                        current:
                            _vacationsController.currentVacationIndex.value,
                      ),
                    ),
                    13.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25,
                      ),
                      child: VacationInfoContainer(
                        vacationPercentage:
                            _vacationsController.vacationPercentage,
                        takenDays: _vacationsController.takenDays,
                        leftDays: _vacationsController.leftDays,
                      ),
                    ),
                    22.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25,
                      ),
                      child: VacationOfficialInfoContainer(
                        nextVacation: _vacationsController.nextVacation,
                      ),
                    ),
                    22.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25,
                      ),
                      child: CarouselSlider.builder(
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
                          Map<String, dynamic> item =
                              _vacationsController.officialVacationList[index];

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
                          onPageChanged: (index, reason) => _vacationsController
                              .onChangeOfficialVacationList(index, reason),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    10.h.verticalSpace,
                    Obx(
                      () => CustomDotsIndicator(
                        length:
                            _vacationsController.officialVacationList.length,
                        current: _vacationsController
                            .currentOfficialVacationIndex.value,
                      ),
                    ),
                    20.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
