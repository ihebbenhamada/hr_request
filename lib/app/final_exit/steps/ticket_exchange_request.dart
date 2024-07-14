import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../main/controllers/final_exit_controller.dart';

class TicketExchangeRequest extends StatelessWidget {
  const TicketExchangeRequest({
    super.key,
    required this.finalExitController,
  });
  final FinalExitController finalExitController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              children: [
                14.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: 60.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'payment_type'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<DropDownModel>(
                                isDense: true,
                                value: finalExitController
                                    .selectedPaymentType.value,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                                isExpanded: true,
                                padding: EdgeInsets.zero,
                                icon: Image.asset(
                                  AppImages.arrowDown,
                                  height: 8.h,
                                  color: AppColors.white,
                                ),
                                dropdownColor: AppColors.blueDark,
                                onChanged: (DropDownModel? newValue) =>
                                    finalExitController
                                        .onSelectPaymentType(newValue!),
                                items: finalExitController.paymentTypeList
                                    .map<DropdownMenuItem<DropDownModel>>(
                                        (DropDownModel value) {
                                  return DropdownMenuItem<DropDownModel>(
                                    value: value,
                                    child: Text(value.text ?? '0'),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () => finalExitController.selectDate(
                            context, 'secondStep'),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 60.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'due_date'.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                finalExitController.dueDate.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.white,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.h.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'description'.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                        controller: finalExitController
                            .descriptionTextEditingController,
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          isDense: true,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        maxLines: 5,
                        autocorrect: false,
                        enableSuggestions: false,
                        enabled: true,
                        enableInteractiveSelection: true,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.white,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                23.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
