import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_info_container.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_official_info_container.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-slider/custom_dots-indicator.dart';
import 'package:request_hr/widgets/official-vacation-item/official_vacation_item.dart';
import 'package:request_hr/widgets/vacation-item/vacation_item.dart';

class VacationsScreen extends StatelessWidget {
  final _vacationsController = Get.put(VacationsController());
  final ThemeController _themeController = Get.find();
  VacationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create\nNew Vacation',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _vacationsController.onClickVacationItem,
                  child: Image.asset(
                    AppImages.addDecision,
                    height: 34.h,
                    width: 34.h,
                  ),
                )
              ],
            ),
            16.h.verticalSpace,
            VacationCategories(
              selectedFilter: _vacationsController.selectedFilter,
              onSelectFilter: (int index) =>
                  _vacationsController.onSelectFilter(index),
            ),
            30.h.verticalSpace,
            CarouselSlider.builder(
              itemCount: _vacationsController.vacationsList.length,
              itemBuilder: (context, index, i) {
                String slideKey =
                    _vacationsController.vacationsList.keys.elementAt(index);
                List<Map<String, dynamic>> slideItems =
                    _vacationsController.vacationsList[slideKey];
                return VacationItem(
                  title: slideItems[0]['title'],
                  startDate: slideItems[0]['start_date'],
                  endDate: slideItems[0]['end_date'],
                  icon: slideItems[0]['icon'],
                  withAlert: slideItems[0]['with_alert'],
                  color: slideItems[0]['color'],
                  iconHeight: slideItems[0]['icon_height'],
                  onClick: _vacationsController.onClickVacationItem,
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
                    _vacationsController.onChangeVacationList(index, reason),
                scrollDirection: Axis.horizontal,
              ),
            ),
            14.h.verticalSpace,
            CustomDotsIndicator(
              length: _vacationsController.vacationsList.length,
              current: _vacationsController.currentVacationIndex,
            ),
            13.h.verticalSpace,
            const VacationInfoContainer(),
            22.h.verticalSpace,
            const VacationOfficialInfoContainer(),
            22.h.verticalSpace,
            CarouselSlider.builder(
              itemCount: _vacationsController.officialVacationList.length,
              itemBuilder: (context, index, i) {
                String slideKey = _vacationsController.officialVacationList.keys
                    .elementAt(index);
                List<Map<String, dynamic>> slideItems =
                    _vacationsController.officialVacationList[slideKey];
                return OfficialVacationItem(
                  title: slideItems[0]['title'],
                  icon: slideItems[0]['icon'],
                  date: slideItems[0]['date'],
                );
              },
              options: CarouselOptions(
                height: 70.h,
                clipBehavior: Clip.none,
                animateToClosest: true,
                viewportFraction: 0.55,
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
            7.h.verticalSpace,
            CustomDotsIndicator(
              length: _vacationsController.officialVacationList.length,
              current: _vacationsController.currentOfficialVacationIndex,
            ),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
