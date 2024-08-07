import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/custody/custody-details/controllers/custody_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../widgets/avatar-circle/avatar_circle.dart';

class CustodyDetailsScreen extends StatelessWidget {
  final _custodyDetailsController = Get.put(CustodyDetailsController());
  CustodyDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.gray2,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
              Row(
                children: [
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
                  10.h.horizontalSpace,
                  Text(
                    'create_custody'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Center(
                child: AvatarCircle(
                  image: AppImages.profile,
                  icon: AppImages.innTechDark,
                  size: 111.h,
                  iconSize: 22.h,
                  imageSize: 95.h,
                  left: 13,
                ),
              ),
              30.h.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width * 0.485 -
                                25.0,
                            title: 'custody'.tr,
                            inputType: 'select',
                            selectedDropDownItem:
                                _custodyDetailsController.selectedPaymentType,
                            onSelect: (value) => _custodyDetailsController
                                .onSelectPaymentType(value),
                            listDropDown:
                                _custodyDetailsController.paymentTypeList,
                          ),
                          10.h.verticalSpace,
                          InputForm(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width * 0.485 -
                                25.0,
                            title: 'total_custody_amount'.tr,
                            inputType: 'input',
                            nbrLines: 1,
                            textEditingController: _custodyDetailsController
                                .totalCustodyTextEditingController,
                            keyboardType: TextInputType.number,
                            inputFormatter: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                        ],
                      ),
                      15.h.verticalSpace,
                      InputForm(
                        height: 55.h,
                        width: double.infinity,
                        title: 'title'.tr,
                        inputType: 'input',
                        nbrLines: 1,
                        textEditingController: _custodyDetailsController
                            .titleCustodyTextEditingController,
                      ),
                      15.h.verticalSpace,
                      InputForm(
                        height: 55.h,
                        width: double.infinity,
                        title: 'custody_name'.tr,
                        inputType: 'input',
                        nbrLines: 1,
                        textEditingController: _custodyDetailsController
                            .nameCustodyTextEditingController,
                      ),
                      15.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width * 0.485 -
                                25.0,
                            title: 'custody_type'.tr,
                            inputType: 'select',
                            selectedDropDownItem:
                                _custodyDetailsController.selectedCustodyType,
                            onSelect: (value) => _custodyDetailsController
                                .onSelectCustodyType(value),
                            listDropDown:
                                _custodyDetailsController.custodyTypeList,
                          ),
                          10.h.verticalSpace,
                          Obx(
                            () => InputForm(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width * 0.485 -
                                  25.0,
                              title: 'date_custody'.tr,
                              inputType: 'date',
                              text: DateFormat('dd-MM-yyyy').format(
                                _custodyDetailsController.custodyDate.value,
                              ),
                              onSelectDate: () =>
                                  _custodyDetailsController.selectDate(context),
                            ),
                          ),
                        ],
                      ),
                      16.h.verticalSpace,
                      InputForm(
                        title: 'topic'.tr,
                        nbrLines: 4,
                        inputType: 'input',
                        textEditingController: _custodyDetailsController
                            .topicCustodyTextEditingController,
                      ),
                      30.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _custodyDetailsController.onClickSubmit,
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
                            onTap: _custodyDetailsController.onClickBack,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
