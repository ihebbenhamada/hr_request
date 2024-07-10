import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/api/models/public/department.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/api/models/public/meeting_point.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/model/meeting_response.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/widgets/meeting_point_item.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../controllers/meetings_details_controller.dart';

class MeetingsDetailsScreen extends StatefulWidget {
  const MeetingsDetailsScreen({
    super.key,
    this.meetingItem,
  });
  final MeetingResponse? meetingItem;

  @override
  State<MeetingsDetailsScreen> createState() => _MeetingsDetailsScreenState();
}

class _MeetingsDetailsScreenState extends State<MeetingsDetailsScreen> {
  final _meetingsDetailsController = Get.put(MeetingsDetailsController());

  @override
  void initState() {
    if (widget.meetingItem != null) {
      _meetingsDetailsController.meetingDate.value =
          widget.meetingItem!.meetingDate!.substring(0, 10);

      _meetingsDetailsController.meetingTitleTextEditingController.text =
          widget.meetingItem?.meetingTitle ?? "";
      _meetingsDetailsController.meetingSubjectTextEditingController.text =
          widget.meetingItem?.subject ?? "";

      _meetingsDetailsController.meetingPointList.value =
          widget.meetingItem!.meetingPoints!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: 90.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.meetingItem != null
                ? Padding(
                    padding: EdgeInsets.only(
                      right: Get.locale?.languageCode == 'en' ? 25.0 : 0,
                      left: Get.locale?.languageCode == 'ar' ? 25.0 : 0,
                    ),
                    child: SizedBox(
                      height: 111.h,
                      width: double.infinity,
                      child: Stack(
                        alignment: Get.locale?.languageCode == 'en'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        children: [
                          Container(
                            width: 360.w,
                            height: 80.h,
                            padding: EdgeInsets.only(
                              left: Get.locale?.languageCode == 'en' ? 25.0 : 0,
                              right:
                                  Get.locale?.languageCode == 'ar' ? 25.0 : 0,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              image: DecorationImage(
                                image: AssetImage(AppImages.poster),
                                fit: BoxFit.cover,
                                matchTextDirection: true,
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
                                        borderRadius:
                                            BorderRadius.circular(20.h),
                                        border:
                                            Border.all(color: AppColors.blue1),
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
                                      widget.meetingItem?.assigneeByName ?? "",
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
                                        borderRadius:
                                            BorderRadius.circular(20.h),
                                        border:
                                            Border.all(color: AppColors.blue1),
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
                                      widget.meetingItem?.assigneeName ?? "",
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
                                        borderRadius:
                                            BorderRadius.circular(20.h),
                                        border:
                                            Border.all(color: AppColors.blue1),
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
                                      widget.meetingItem?.creationDate
                                              ?.substring(0, 10) ??
                                          "",
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
                            right: Get.locale?.languageCode == 'en' ? 0 : null,
                            left: Get.locale?.languageCode == 'ar' ? 0 : null,
                            child: AvatarCircle(
                              image: null,
                              isNetworkImage: true,
                              size: 112.h,
                              iconSize: 22.h,
                              imageSize: 95.h,
                              left: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            40.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => InputForm(
                          height: 55.h,
                          width:
                              MediaQuery.of(context).size.width * 0.485 - 25.0,
                          title: 'date'.tr,
                          inputType: 'date',
                          text: _meetingsDetailsController.meetingDate.value,
                          onSelectDate: () => _meetingsDetailsController
                              .selectDate(context, 'from'),
                        ),
                      ),
                      Container(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        padding: const EdgeInsets.only(
                          left: 11,
                          right: 11,
                          bottom: 0,
                          top: 0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.h),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "depart".tr,
                              style: TextStyle(
                                color: AppColors.gray6,
                                fontSize: 14.sp,
                              ),
                            ),
                            3.verticalSpace,
                            Obx(
                              () => DropdownButtonHideUnderline(
                                child: DropdownButton<Department>(
                                  isDense: true,
                                  dropdownColor: AppColors.white,
                                  value: _meetingsDetailsController
                                      .selectedDepartment.value,
                                  style: TextStyle(
                                    color: AppColors.blueDark,
                                    fontSize: 14.sp,
                                  ),
                                  isExpanded: true,
                                  alignment: Alignment.bottomCenter,
                                  icon: Image.asset(
                                    AppImages.arrowDown,
                                    height: 8.h,
                                  ),
                                  onChanged: (Department? newValue) =>
                                      _meetingsDetailsController
                                          .onSelectDepartment(newValue!),
                                  items: _meetingsDetailsController
                                      .departmentList
                                      .map<DropdownMenuItem<Department>>(
                                          (Department value) {
                                    return DropdownMenuItem<Department>(
                                      alignment:
                                          Get.locale?.languageCode == 'en'
                                              ? Alignment.centerLeft
                                              : Alignment.centerRight,
                                      value: value,
                                      child: Text(
                                        (Get.locale?.languageCode == 'en'
                                                ? value.departmentNameEn
                                                : value.departmentNameAr) ??
                                            '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  13.h.verticalSpace,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.h),
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
                            5.h.verticalSpace,
                            Text(
                              "invitation_to".tr,
                              style: TextStyle(
                                color: AppColors.gray6,
                                fontSize: 14.sp,
                              ),
                            ),
                            CustomDropdown<Employee>.multiSelectSearchRequest(
                              items: _meetingsDetailsController.employeeList,
                              hintText: "select_employees".tr,
                              closedHeaderPadding:
                                  EdgeInsets.only(bottom: 10.h),
                              listItemBuilder: (context, employee, isSelected,
                                  onItemSelect) {
                                return Text(employee.fullName ?? "");
                              },
                              enabled: widget.meetingItem == null,
                              decoration: CustomDropdownDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  closedSuffixIcon: Image.asset(
                                    AppImages.arrowDown,
                                    height: 8.h,
                                    color: AppColors.blueDark,
                                  )),
                              headerListBuilder: (context, employees, isTrue) {
                                String listEmployees = "";
                                employees.forEach((e) {
                                  listEmployees =
                                      '$listEmployees${Get.locale?.languageCode == 'en' && e.fullNameEn != null ? e.fullNameEn : e.fullName!}${Get.locale?.languageCode == 'en' ? ',' : '،'} ';
                                });
                                return Text(listEmployees);
                              },
                              onListChanged: (List<Employee> list) =>
                                  _meetingsDetailsController
                                      .onChangeListEmployee(list),
                              futureRequest: (value) =>
                                  _meetingsDetailsController
                                      .searchEmployee(value),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Container(
                          height: 26.h,
                          padding: EdgeInsets.only(right: 8.0, bottom: 6.h),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                _meetingsDetailsController.imageList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: const ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(color: AppColors.gray3),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.profile),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    width: double.infinity,
                    height: 55.h,
                    title: 'meeting_title'.tr,
                    inputType: 'input',
                    enabled: widget.meetingItem == null,
                    nbrLines: 1,
                    textEditingController: _meetingsDetailsController
                        .meetingTitleTextEditingController,
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    width: double.infinity,
                    title: 'meeting_subject'.tr,
                    inputType: 'input',
                    enabled: widget.meetingItem == null,
                    textEditingController: _meetingsDetailsController
                        .meetingSubjectTextEditingController,
                  ),
                  22.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 44.h,
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: AppColors.primary,
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
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.list,
                              height: 8.6.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'meeting_points'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  19.h.verticalSpace,
                  widget.meetingItem == null
                      ? Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 17.0.h),
                              child: InputForm(
                                width: double.infinity,
                                title: 'add_meeting_points'.tr,
                                inputType: 'input',
                                nbrLines: 2,
                                textEditingController:
                                    _meetingsDetailsController
                                        .meetingPointTextEditingController,
                              ),
                            ),
                            Positioned(
                              right:
                                  Get.locale?.languageCode == 'en' ? 31 : null,
                              left:
                                  Get.locale?.languageCode == 'ar' ? 31 : null,
                              bottom: 0.h,
                              child: InkWell(
                                onTap: () => _meetingsDetailsController
                                    .addMeetingPoint(),
                                child: Container(
                                  height: 34.h,
                                  width: 34.h,
                                  decoration: const ShapeDecoration(
                                    color: AppColors.white,
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        color: AppColors.gray2,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppImages.add,
                                      height: 12.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  10.h.verticalSpace,
                  Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        MeetingPoint item =
                            _meetingsDetailsController.meetingPointList[index];
                        return MeetingPointItem(
                          name: widget.meetingItem == null
                              ? item.pointText
                              : '${index + 1}- ${item.pointText}',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 13.h.verticalSpace;
                      },
                      itemCount:
                          _meetingsDetailsController.meetingPointList.length,
                    ),
                  ),
                  25.h.verticalSpace,
                  widget.meetingItem == null
                      ? GestureDetector(
                          onTap: _meetingsDetailsController.uploadAttachment,
                          child: Align(
                            alignment: Get.locale?.languageCode == 'en'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 162,
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: AppColors.primary,
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
                                children: [
                                  11.horizontalSpace,
                                  Image.asset(
                                    AppImages.upload,
                                    height: 17.h,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'upload_attachment'.tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  20.h.verticalSpace,
                  _meetingsDetailsController.files.isNotEmpty
                      ? SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _meetingsDetailsController.files.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(
                                  _meetingsDetailsController.files[index].path,
                                ),
                                fit: BoxFit.cover,
                                width: 100.h,
                                height: 100.h,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return 10.horizontalSpace;
                            },
                          ),
                        )
                      : const SizedBox(),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.meetingItem == null
                          ? GestureDetector(
                              onTap: _meetingsDetailsController.onClickDone,
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
                        onTap: () {
                          Get.back(id: 4);
                        },
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
