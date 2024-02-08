import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/home/controllers/home_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/widgets/carousel-slider-meetings/carousel_slider-meetings.dart';
import 'package:request_hr/widgets/carousel-slider/custom_dots-indicator.dart';

import '../../../../../widgets/bonus-punishment-category-item/bonus_punishments_category_item.dart';
import '../../../../../widgets/carousel-slider-bonus-punishments/carousel_slider-bonus-punishments.dart';
import '../../../../../widgets/carousel-slider/carousel_slider.dart';
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
            'Find your\nGeneral Information',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          5.h.verticalSpace,
          CarouselSlider.builder(
            itemCount: _homeController.carouselData.length,
            itemBuilder: (context, index, i) {
              String slideKey =
                  _homeController.carouselData.keys.elementAt(index);
              List<Map<String, dynamic>> slideItems =
                  _homeController.carouselData[slideKey];
              return CarouselSliderItem(slideItems: slideItems);
            },
            options: CarouselOptions(
              height: 165.h,
              viewportFraction: 1,
              clipBehavior: Clip.none,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              padEnds: false,
              onPageChanged: (index, reason) =>
                  _homeController.onChangeCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          CustomDotsIndicator(
            carouselData: _homeController.carouselData,
            current: _homeController.current,
          ),
          15.h.verticalSpace,
          const GeneralInformation(),
          19.h.verticalSpace,
          Text(
            'Find your\nBonus, Punishments and  Alerts',
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
              String slideKey = _homeController
                  .carouselBonusPunishmentsData.keys
                  .elementAt(index);
              List<Map<String, dynamic>> slideItems =
                  _homeController.carouselBonusPunishmentsData[slideKey];
              return CarouselSliderBonusPunishmentsItem(
                slideItems: slideItems,
              );
            },
            options: CarouselOptions(
              height: 148.h,
              viewportFraction: 1,
              clipBehavior: Clip.none,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              padEnds: false,
              onPageChanged: (index, reason) => _homeController
                  .onChangeBonusPunishmentsCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          10.h.verticalSpace,
          CustomDotsIndicator(
            carouselData: _homeController.carouselBonusPunishmentsData,
            current: _homeController.currentBonusPunishments,
          ),
          15.h.verticalSpace,
          Text(
            'Find your\nIncoming Meeting',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          CarouselSlider.builder(
            itemCount: _homeController.carouselMeetingsData.length,
            itemBuilder: (context, index, i) {
              String slideKey =
                  _homeController.carouselMeetingsData.keys.elementAt(index);
              List<Map<String, dynamic>> slideItems =
                  _homeController.carouselMeetingsData[slideKey];
              return CarouselSliderMeetingsItem(
                slideItems: slideItems,
              );
            },
            options: CarouselOptions(
              height: 120.h,
              animateToClosest: true,
              clipBehavior: Clip.none,
              viewportFraction: 0.7,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              enlargeCenterPage: true,
              padEnds: false,
              pageSnapping: false,
              onPageChanged: (index, reason) =>
                  _homeController.onChangeMeetingCarousel(index, reason),
              scrollDirection: Axis.horizontal,
            ),
          ),
          7.h.verticalSpace,
          CustomDotsIndicator(
            carouselData: _homeController.carouselMeetingsData,
            current: _homeController.currentMeeting,
          ),
          20.h.verticalSpace,
        ],
      ),
    );
  }
}
