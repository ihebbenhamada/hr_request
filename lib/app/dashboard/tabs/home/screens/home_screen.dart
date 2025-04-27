import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/home/controllers/home_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/widgets/carousel-info-item/carousel_info_item.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';
import 'package:request_hr/widgets/carousel-slider-meetings/carousel_slider-meetings.dart';

import '../../../../../widgets/bonus-punishment-category-item/bonus_punishments_category_item.dart';
import '../../../../../widgets/carousel-slider-bonus-punishments/carousel_slider-bonus-punishments.dart';
import '../../../../../widgets/general_information/general_informations.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        bottom: Platform.isIOS ? 50.h : 64.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'find_your'.tr,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          Text(
            'general_information'.tr,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          12.h.verticalSpace,
          CarouselSlider.builder(
            itemCount:
                _homeController.dashboardInfo.value.getGeneralInfos().length,
            itemBuilder: (context, index, i) {
              Map<String, dynamic> item =
                  _homeController.dashboardInfo.value.getGeneralInfos()[index];
              //Logger().e(item.toString());
              print(item);
              return CarouselInfoItem(
                title: item['title'],
                value: item['value'],
                image: item['image'],
                color: item['color'],
              );
            },
            options: CarouselOptions(
              height: 142.h,
              clipBehavior: Clip.none,
              initialPage: 0,
              viewportFraction: 0.39,
              pageSnapping: false,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: false,
              padEnds: false,
              onPageChanged: (index, reason) =>
                  _homeController.onChangeCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          12.h.verticalSpace,
          Obx(
            () => CustomDotsIndicator(
              length:
                  _homeController.dashboardInfo.value.getGeneralInfos().length,
              current: _homeController.current.value,
            ),
          ),
          15.h.verticalSpace,
          Obx(
            () => GeneralInformation(
              contractFrom:
                  _homeController.dashboardInfo.value.contractDateFrom,
              contractTo: _homeController.dashboardInfo.value.contractDateTo,
              workPeriod: _homeController.workPeriod.value,
              vacationsCount: _homeController
                  .dashboardInfo.value.annualLeaveCount
                  .toString(),
              hasTicket: _homeController.dashboardInfo.value.hasAirlineTicket
                  ? 'Yes'
                  : 'No',
              indemnity: '19-02-2040',
              meetings:
                  _homeController.dashboardInfo.value.meetingsCount.toString(),
            ),
          ),
          19.h.verticalSpace,
          Text(
            '${'find_your'.tr}\n${'bonus'.tr}${','.tr} ${'punishments'.tr} ${'and'.tr} ${'alerts'.tr}',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          12.h.verticalSpace,
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Map<String, dynamic> item =
                    _homeController.bonusPunishmentCategoryList[index];
                return Obx(
                  () => BonusPunishmentsCategoryItem(
                    index: index,
                    title: item['title'],
                    isNew: item['is_new'],
                    onSelectBonusPunishment: () =>
                        _homeController.onSelectBonusPunishment(index),
                    selectedBonusPunishments:
                        _homeController.selectedBonusPunishments.value,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: _homeController.bonusPunishmentCategoryList.length,
            ),
          ),
          10.h.verticalSpace,
          CarouselSlider.builder(
            itemCount: _homeController.carouselBonusPunishmentsData.length,
            itemBuilder: (context, index, i) {
              Map<String, dynamic> item =
                  _homeController.carouselBonusPunishmentsData[index];
              return CarouselSliderBonusPunishmentsItem(
                title: item['title'],
                amount: item['amount'],
                image: item['image'],
                type: item['type'],
              );
            },
            options: CarouselOptions(
              height: 148.h,
              viewportFraction: 0.39,
              clipBehavior: Clip.none,
              initialPage: 0,
              enableInfiniteScroll: true,
              pageSnapping: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: false,
              padEnds: false,
              onPageChanged: (index, reason) => _homeController
                  .onChangeBonusPunishmentsCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          10.h.verticalSpace,
          Obx(
            () => CustomDotsIndicator(
              length: _homeController.carouselBonusPunishmentsData.length,
              current: _homeController.currentBonusPunishments.value,
            ),
          ),
          15.h.verticalSpace,
          Text(
            '${'find_your'.tr}\n${'incoming_meeting'.tr}',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          CarouselSlider.builder(
            itemCount: _homeController.carouselMeetingsData.length,
            itemBuilder: (context, index, i) {
              Map<String, dynamic> item =
                  _homeController.carouselMeetingsData[index];
              return CarouselSliderMeetingsItem(
                title: item['title'],
                image: item['image'],
                description: item['description'],
                date: item['date'],
              );
            },
            options: CarouselOptions(
              height: 120.h,
              animateToClosest: true,
              clipBehavior: Clip.none,
              viewportFraction: 0.7,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              padEnds: false,
              pageSnapping: false,
              onPageChanged: (index, reason) =>
                  _homeController.onChangeMeetingCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          15.h.verticalSpace,
          Obx(
            () => CustomDotsIndicator(
              length: _homeController.carouselMeetingsData.length,
              current: _homeController.currentMeeting.value,
            ),
          ),
          20.h.verticalSpace,
        ],
      ),
    );
  }
}
