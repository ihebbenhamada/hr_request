import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/app/loan/main/controllers/loan_controller.dart';
import 'package:request_hr/app/loan/widgets/loan_item.dart';
import 'package:request_hr/app/loan/widgets/loan_statistics_container.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';

import '../../widgets/loan_info_container.dart';

class LoanScreen extends StatelessWidget {
  final _loanController = Get.put(LoanController());
  final ThemeController _themeController = Get.find();
  LoanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40.h,
                width: 40.h,
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
            7.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create Loan',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _loanController.onClickCreateLoan,
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
              selectedFilter: _loanController.selectedFilter,
              onSelectFilter: (int index) =>
                  _loanController.onSelectFilter(index),
            ),
            30.h.verticalSpace,
            CarouselSlider.builder(
              itemCount: _loanController.carouselLoanList.length + 1,
              itemBuilder: (context, index, i) {
                if (index == _loanController.carouselLoanList.length) {
                  // Display fake item at the last index
                  return const SizedBox();
                } else {
                  Map<String, dynamic> item =
                      _loanController.carouselLoanList[index];
                  // Display real items
                  return LoanItem(
                    title: item['title'],
                    cost: item['cost'],
                    icon: item['icon'],
                    date: item['date'],
                    type: item['type'],
                    editable: item['editable'],
                    onClick: _loanController.onClickLoanItem,
                  );
                }
              },
              options: CarouselOptions(
                height: 140.h,
                animateToClosest: true,
                clipBehavior: Clip.none,
                viewportFraction: 0.4,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: false,
                padEnds: false,
                pageSnapping: false,
                onPageChanged: (index, reason) =>
                    _loanController.onChangeLoanCarousel(index, reason),
                scrollDirection: Axis.horizontal,
              ),
            ),
            20.h.verticalSpace,
            Obx(
              () => CustomDotsIndicator(
                current: _loanController.currentLoanIndex.value,
                length: _loanController.carouselLoanList.length,
              ),
            ),
            13.h.verticalSpace,
            const LoanInfoContainer(),
            22.h.verticalSpace,
            LoanStatisticsContainer(),
          ],
        ),
      ),
    );
  }
}
