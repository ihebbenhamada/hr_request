import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/complaint/complaint-details/controllers/complaint_details_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  final _complaintDetailsController = Get.put(ComplaintDetailsController());
  ComplaintDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    margin: const EdgeInsets.only(left: 25),
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
                10.h.horizontalSpace,
                Text(
                  'Create complaint',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SizedBox(
                height: 111.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 360.w,
                      height: 80.h,
                      padding: const EdgeInsets.only(left: 25),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          image: AssetImage(AppImages.poster),
                          fit: BoxFit.cover,
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
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
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
                                _complaintDetailsController
                                    .employee.value.fullNameEn,
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
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
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
                                _complaintDetailsController
                                    .employee.value.jobName,
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
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
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
                                _complaintDetailsController
                                    .employee.value.creationDate
                                    .substring(0, 10),
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
                      right: 0,
                      child: AvatarCircle(
                        image: AppImages.avatar3,
                        size: 112.h,
                        iconSize: 22.h,
                        imageSize: 95.h,
                        left: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
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
                          "Send Complaint To",
                          style: TextStyle(
                            color: AppColors.gray6,
                            fontSize: 14.sp,
                          ),
                        ),
                        GetBuilder<ComplaintDetailsController>(
                          builder: (_) => CustomDropdown<
                              DropDownModel>.multiSelectSearchRequest(
                            items: _complaintDetailsController.jobTypesList,
                            hintText: "Select job type",
                            closedHeaderPadding: EdgeInsets.only(bottom: 10.h),
                            listItemBuilder:
                                (context, jobType, isSelected, onItemSelect) {
                              return Text(
                                jobType.text ?? "",
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.blueDark,
                                ),
                              );
                            },
                            overlayHeight:
                                MediaQuery.of(context).size.height * 0.45,
                            decoration: CustomDropdownDecoration(
                              closedFillColor: AppColors.white,
                              headerStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDark,
                              ),
                              listItemDecoration: const ListItemDecoration(
                                selectedColor: AppColors.primary,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDark.withOpacity(0.56),
                              ),
                              closedSuffixIcon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                                color: AppColors.blueDark,
                              ),
                            ),
                            headerListBuilder: (context, jobTypes, isTrue) {
                              String listJobTypes = "";
                              jobTypes.forEach((e) {
                                listJobTypes = '$listJobTypes${e.text!}، ';
                              });
                              return Text(
                                listJobTypes,
                                style:
                                    const TextStyle(color: AppColors.blueDark),
                              );
                            },
                            onListChanged: (List<DropDownModel> list) =>
                                _complaintDetailsController
                                    .onChangeListJobs(list),
                            futureRequest: (value) =>
                                _complaintDetailsController
                                    .searchJobType(value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Subject',
                    inputType: 'input',
                    nbrLines: 1,
                    textEditingController: _complaintDetailsController
                        .subjectTextEditingController,
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    width: double.infinity,
                    title: 'Description',
                    inputType: 'input',
                    textEditingController: _complaintDetailsController
                        .descriptionTextEditingController,
                  ),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _complaintDetailsController.onClickSubmit,
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
                      ),
                      23.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.back();
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
