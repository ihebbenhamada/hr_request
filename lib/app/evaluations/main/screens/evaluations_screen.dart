import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:request_hr/app/evaluations/main/controllers/evaluations_controller.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';

import '../widgets/evaluation_item.dart';

class EvaluationsScreen extends StatelessWidget {
  final _evaluationsController = Get.put(EvaluationsController());
  final ThemeController _themeController = Get.find();
  EvaluationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'evaluations_year'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                _evaluationsController.isAdmin
                    ? GestureDetector(
                        onTap: _evaluationsController.onClickCreateEvaluation,
                        child: Image.asset(
                          AppImages.addDecision,
                          height: 34.h,
                          width: 34.h,
                          matchTextDirection: true,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _evaluationsController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Container(
                        color: AppColors.gray2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.h.verticalSpace,
                            Obx(
                              () => _evaluationsController
                                      .listHrEmployeeEvaluations.isNotEmpty
                                  ? CarouselSlider.builder(
                                      itemCount: _evaluationsController
                                              .evaluationList.length +
                                          1,
                                      itemBuilder: (context, index, i) {
                                        if (index ==
                                            _evaluationsController
                                                .evaluationList.length) {
                                          // Display fake item at the last index
                                          return const SizedBox();
                                        } else {
                                          Evaluation item =
                                              _evaluationsController
                                                  .evaluationList[index];
                                          // Display real items
                                          return EvaluationItem(
                                            employeeName:
                                                item.evaluatedEmployee ?? "",
                                            employeePosition:
                                                item.evaluationFormName ?? "",
                                            employeeImage:
                                                item.evaluatedByImagePath ?? "",
                                            date: item.evaluationDate
                                                    ?.substring(0, 10) ??
                                                "",
                                            editable: true,
                                            onClick: _evaluationsController
                                                .onClickItemEvaluation,
                                          );
                                        }
                                      },
                                      options: CarouselOptions(
                                        height: 170.h,
                                        animateToClosest: true,
                                        clipBehavior: Clip.none,
                                        viewportFraction: 0.45,
                                        initialPage: 0,
                                        enableInfiniteScroll: false,
                                        reverse: false,
                                        autoPlay: false,
                                        enlargeCenterPage: false,
                                        padEnds: false,
                                        pageSnapping: false,
                                        onPageChanged: (index, reason) =>
                                            _evaluationsController
                                                .onChangeEvaluationCarousel(
                                                    index, reason),
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'no_evaluation_found'.tr,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                            ),
                            20.h.verticalSpace,
                            Obx(
                              () => CustomDotsIndicator(
                                current: _evaluationsController
                                    .currentEvaluation.value,
                                length: _evaluationsController
                                    .evaluationList.length,
                              ),
                            ),
                            20.h.verticalSpace,
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                top: 14.h,
                                bottom: 23.h,
                                left: Get.locale?.languageCode == 'en' ? 16 : 0,
                                right:
                                    Get.locale?.languageCode == 'ar' ? 16 : 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'evaluations_chart'.tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  /*Obx(
                                    () => Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () => _evaluationsController
                                              .onSelectChart(0),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: _evaluationsController
                                                          .selectedChart
                                                          .value ==
                                                      0
                                                  ? AppColors.gray9
                                                  : AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Years',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.gray8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => _evaluationsController
                                              .onSelectChart(1),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5.h,
                                            ),
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                              color: _evaluationsController
                                                          .selectedChart
                                                          .value ==
                                                      1
                                                  ? AppColors.gray9
                                                  : AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'LastMonths',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.gray8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),*/
                                  15.h.verticalSpace,
                                  Obx(
                                    () => Container(
                                      height: 162.h,
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Center(
                                        child: BarChart(
                                          BarChartData(
                                            backgroundColor: AppColors.white,
                                            borderData: FlBorderData(
                                              border: const Border(
                                                left: BorderSide(
                                                  color: AppColors.gray7,
                                                ),
                                                bottom: BorderSide(
                                                  color: AppColors.gray7,
                                                ),
                                              ),
                                            ),
                                            titlesData: FlTitlesData(
                                              topTitles: const AxisTitles(
                                                sideTitles: SideTitles(
                                                    showTitles: false),
                                              ),
                                              rightTitles: const AxisTitles(
                                                sideTitles: SideTitles(
                                                    showTitles: false),
                                              ),
                                              leftTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  reservedSize: 20,
                                                  interval: 10,
                                                  getTitlesWidget:
                                                      (value, titleMeta) {
                                                    return SideTitleWidget(
                                                      axisSide: AxisSide.bottom,
                                                      child: Text(
                                                        value
                                                            .toInt()
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color:
                                                              AppColors.gray8,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              bottomTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  reservedSize: 25,
                                                  interval: 10,
                                                  getTitlesWidget:
                                                      (value, titleMeta) {
                                                    switch (value.toInt()) {
                                                      case 1:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'jan'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 2:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'feb'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 3:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'mar'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 4:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'apr'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 5:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'may'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 6:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'jun'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 7:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'jul'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 8:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'aug'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 9:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'sep'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 10:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'oct'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 11:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'nov'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      case 12:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'dec'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                      // Add more cases as needed...
                                                      default:
                                                        return SideTitleWidget(
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          child: Text(
                                                            'no_month'.tr,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .gray8,
                                                            ),
                                                          ),
                                                        );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            gridData: const FlGridData(
                                              show: false,
                                              horizontalInterval: 10,
                                              verticalInterval: 10,
                                            ),
                                            barGroups: _evaluationsController
                                                .barGroups.value,
                                            barTouchData: BarTouchData(
                                              touchTooltipData:
                                                  BarTouchTooltipData(
                                                //tooltipBgColor: AppColors.white,
                                                direction: TooltipDirection.top,
                                                tooltipPadding: EdgeInsets.zero,
                                                tooltipMargin: 0,
                                                getTooltipItem: (a, b, c, d) {
                                                  return BarTooltipItem(
                                                    '',
                                                    TextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            14.h.verticalSpace,
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(13.h),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 202.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'evolution_this_month'.tr,
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        5.h.verticalSpace,
                                        Text(
                                          'congratulation_eval'.tr,
                                          style: TextStyle(
                                            color: AppColors.blueDark,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        17.h.verticalSpace,
                                        Stack(
                                          alignment:
                                              Get.locale?.languageCode == 'en'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                          children: [
                                            Container(
                                              height: 21.h,
                                              padding: EdgeInsets.only(
                                                left:
                                                    Get.locale?.languageCode ==
                                                            'en'
                                                        ? 25
                                                        : 10,
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ar'
                                                        ? 25
                                                        : 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(11.h),
                                                color: AppColors.primary,
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  '${'total'.tr}: ${_evaluationsController.totalMonthDegreeScale.value}',
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 21.h,
                                              height: 21.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(21.h),
                                                border: Border.all(
                                                  color: AppColors.primary,
                                                ),
                                                color: AppColors.white,
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  AppImages.evaluationsDrawer,
                                                  height: 9.5.h,
                                                  color: AppColors.blueDark,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Obx(
                                      () => CircularPercentIndicator(
                                        radius: 48.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: double.parse(
                                          _evaluationsController
                                              .percentage.value,
                                        ),
                                        center: Text(
                                          '${(double.parse(_evaluationsController.percentage.value) * 100).toStringAsFixed(1)}%',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 27.sp,
                                          ),
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.butt,
                                        progressColor: AppColors.primary,
                                        backgroundColor: AppColors.blueLight1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
