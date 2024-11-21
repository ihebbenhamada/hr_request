import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/loan/main/controllers/loan_controller.dart';
import 'package:request_hr/app/loan/main/models/loan_response.dart';
import 'package:request_hr/app/loan/widgets/loan_item.dart';
import 'package:request_hr/app/loan/widgets/loan_statistics_container.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';

import '../../../dashboard/tabs/vacations/widgets/vacation_categories.dart';
import '../../widgets/loan_info_container.dart';

class LoanScreen extends StatelessWidget {
  final _loanController = Get.put(LoanController());
  final ThemeController _themeController = Get.find();
  LoanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
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
                    matchTextDirection: true,
                  ),
                ),
              ),
            ),
            7.h.verticalSpace,
            !GetStorage().read('isChairman')
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'create_loan'.tr,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: _loanController.navigateAndRefresh,
                        child: Image.asset(
                          AppImages.addDecision,
                          height: 34.h,
                          width: 34.h,
                        ),
                      )
                    ],
                  )
                : Text(
                    'employees_loans'.tr,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  ),
            16.h.verticalSpace,
            CategoriesFilter(
              selectedFilter: _loanController.selectedFilter,
              onSelectFilter: (int index) =>
                  _loanController.onSelectFilter(index),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loanController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.h.verticalSpace,
                          Obx(
                            () => _loanController.loanList.isNotEmpty
                                ? CarouselSlider.builder(
                                    itemCount:
                                        _loanController.loanList.length + 1,
                                    itemBuilder: (context, index, i) {
                                      if (index ==
                                          _loanController.loanList.length) {
                                        // Display fake item at the last index
                                        return const SizedBox();
                                      } else {
                                        Loan item =
                                            _loanController.loanList[index];
                                        // Display real items
                                        return LoanItem(
                                          title: item.title,
                                          cost: item.amount,
                                          icon: item.icon ??
                                              AppImages.doubleCheck,
                                          date: item.creationDate
                                              .substring(0, 10),
                                          type: item.type ?? 0,
                                          editable: true,
                                          onClickEdit: () => _loanController
                                              .onClickUpdate(id: item.id),
                                          onClick: () => _loanController
                                              .onClickLoanItem(item),
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
                                          _loanController.onChangeLoanCarousel(
                                              index, reason),
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      'no_loan_found'.tr,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                          ),
                          20.h.verticalSpace,
                          Obx(
                            () => CustomDotsIndicator(
                              current: _loanController.currentLoanIndex.value,
                              length: _loanController.loanList.length,
                            ),
                          ),
                          13.h.verticalSpace,
                          Obx(
                            () => LoanInfoContainer(
                              loanResponse:
                                  _loanController.empLoanResponse.value,
                            ),
                          ),
                          22.h.verticalSpace,
                          Obx(
                            () => LoanStatisticsContainer(
                              loanResponse:
                                  _loanController.empLoanResponse.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
