import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:request_hr/app/punishments/main/controllers/punishments_controller.dart';
import 'package:request_hr/app/punishments/main/models/punishment_response.dart';
import 'package:request_hr/app/punishments/widgets/punishment_item.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/carousel-info-item/custom_dots-indicator.dart';

class PunishmentsScreen extends StatelessWidget {
  final _punishmentsController = Get.put(PunishmentsController());
  final ThemeController _themeController = Get.find();
  PunishmentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25.0,
          left: 25.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            10.h.verticalSpace,
            !_punishmentsController.isAdmin
                ? Text(
                    'Your_punishments'.tr,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  )
                : const SizedBox(),
            _punishmentsController.isAdmin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'create_punishments'.tr,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: _punishmentsController.navigateAndRefresh,
                        child: Image.asset(
                          AppImages.addDecision,
                          height: 34.h,
                          width: 34.h,
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _punishmentsController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h.verticalSpace,
                          Obx(
                            () => _punishmentsController
                                    .punishmentList.value.isNotEmpty
                                ? CarouselSlider.builder(
                                    itemCount: _punishmentsController
                                            .punishmentList.length +
                                        1,
                                    itemBuilder: (context, index, i) {
                                      if (index ==
                                          _punishmentsController
                                              .punishmentList.length) {
                                        // Display fake item at the last index
                                        return const SizedBox();
                                      } else {
                                        Punishment item = _punishmentsController
                                            .punishmentList[index];
                                        // Display real items
                                        return PunishmentItem(
                                          employeeName:
                                              Get.locale?.languageCode == 'en'
                                                  ? item.byAssigneeNameEn ?? ''
                                                  : item.byAssigneeName ?? '',
                                          employeePunishment:
                                              item.amount ?? 0.0,
                                          employeeImage: item.imagePath ?? "",
                                          date: item.creationDate
                                                  ?.substring(0, 10) ??
                                              "",
                                          editable: false,
                                          onClick: () => _punishmentsController
                                              .onClickItemPunishments(item),
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
                                          _punishmentsController
                                              .onChangePunishmentsCarousel(
                                                  index, reason),
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      'no_Punishments_found'.tr,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                          ),
                          20.h.verticalSpace,
                          Obx(
                            () => CustomDotsIndicator(
                              current: _punishmentsController
                                  .currentPunishment.value,
                              length:
                                  _punishmentsController.punishmentList.length,
                            ),
                          ),
                          20.h.verticalSpace,
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              top: 14.h,
                              bottom: 23.h,
                              left: Get.locale?.languageCode == 'en' ? 16 : 0,
                              right: Get.locale?.languageCode == 'ar' ? 16 : 0,
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
                                  'your_punishments_chart'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                                20.h.verticalSpace,
                                Obx(
                                  () => Container(
                                    height: 162.h,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Center(
                                      child: BarChart(
                                        swapAnimationCurve: Curves.bounceIn,
                                        swapAnimationDuration:
                                            const Duration(milliseconds: 0),
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
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            rightTitles: const AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                reservedSize: 20,
                                                interval: 10,
                                                getTitlesWidget:
                                                    (value, titleMeta) {
                                                  return SideTitleWidget(
                                                    meta: TitleMeta(
                                                      axisPosition: 0,
                                                      appliedInterval: 30,
                                                      axisSide: AxisSide.bottom,
                                                      formattedValue:
                                                          value.toString(),
                                                      max: 1000000,
                                                      min: 0,
                                                      parentAxisSize:
                                                          double.infinity,
                                                      rotationQuarterTurns: 0,
                                                      sideTitles: SideTitles(),
                                                    ),
                                                    child: Text(
                                                      value.toInt().toString(),
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: AppColors.gray8,
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
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'jan'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 2:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'feb'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 3:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'mar'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 4:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'apr'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 5:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'may'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 6:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'jun'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 7:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'jul'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 8:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'aug'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 9:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'sep'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 10:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'oct'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 11:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'nov'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    case 12:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'dec'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
                                                          ),
                                                        ),
                                                      );
                                                    // Add more cases as needed...
                                                    default:
                                                      return SideTitleWidget(
                                                        meta: TitleMeta(
                                                          axisPosition: 0,
                                                          appliedInterval: 30,
                                                          axisSide:
                                                              AxisSide.bottom,
                                                          formattedValue:
                                                              value.toString(),
                                                          max: 1000000,
                                                          min: 0,
                                                          parentAxisSize:
                                                              double.infinity,
                                                          rotationQuarterTurns:
                                                              0,
                                                          sideTitles:
                                                              SideTitles(),
                                                        ),
                                                        child: Text(
                                                          'no_month'.tr,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.gray8,
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
                                          barGroups: _punishmentsController
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
                                vertical: 10.h, horizontal: 14),
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
                            child: Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 225.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'your_punishments_year'.tr,
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        5.h.verticalSpace,
                                        Text(
                                          'punishments_sent_year'.tr,
                                          style: TextStyle(
                                            color: AppColors.blueDark,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        33.h.verticalSpace,
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 21.h,
                                              padding: const EdgeInsets.only(
                                                  left: 25, right: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(11.h),
                                                color: AppColors.redLight,
                                              ),
                                              child: Text(
                                                '${'total'.tr}: ${_punishmentsController.total.value}',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14.sp,
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
                                                  color: AppColors.redLight,
                                                ),
                                                color: AppColors.white,
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  AppImages.punishmentsDrawer,
                                                  height: 9.5.h,
                                                  color: AppColors.redLight,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: CircularPercentIndicator(
                                      radius: 48.0,
                                      lineWidth: 10.0,
                                      animation: true,
                                      percent: double.parse(
                                        (_punishmentsController
                                                    .percentage.value /
                                                100)
                                            .toStringAsFixed(2),
                                      ),
                                      center: Text(
                                        '${(_punishmentsController.percentage.value).toStringAsFixed(1)}%',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 27.sp,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      progressColor: AppColors.primary,
                                      backgroundColor: AppColors.blueLight1,
                                    ),
                                  ),
                                ],
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
    );
  }
}
