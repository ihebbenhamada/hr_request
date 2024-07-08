import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/services/evaluations_steps_service.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/interceptor/interceptor.dart';

class FormType extends StatefulWidget {
  const FormType({
    super.key,
    required this.evaluationsStepsService,
    required this.onSelect,
  });
  final EvaluationsStepsService evaluationsStepsService;
  final Function(DropDownModel) onSelect;
  @override
  State<FormType> createState() => _FormTypeState();
}

class _FormTypeState extends State<FormType> {
  RxList<DropDownModel> evalFormTypes = <DropDownModel>[].obs;
  Rx<DropDownModel> selectedEvalForm = DropDownModel().obs;

  @override
  void initState() {
    getFormTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evaluation form model',
            style: TextStyle(fontSize: 14.sp, color: AppColors.white),
          ),
          13.h.verticalSpace,
          Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton<DropDownModel>(
                isDense: true,
                dropdownColor: AppColors.blueDark,
                value: selectedEvalForm.value,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
                isExpanded: true,
                alignment: Alignment.bottomCenter,
                icon: Image.asset(
                  AppImages.arrowDown,
                  height: 8.h,
                  color: AppColors.white,
                ),
                onChanged: (DropDownModel? newValue) =>
                    onSelectEvalForm(newValue!),
                items: evalFormTypes.map<DropdownMenuItem<DropDownModel>>(
                    (DropDownModel value) {
                  return DropdownMenuItem<DropDownModel>(
                    alignment: Alignment.centerLeft,
                    value: value,
                    child: Text(
                      value.text ?? "",
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
          ),
        ],
      ),
    );
  }

  getFormTypes() {
    AppInterceptor.showLoader();
    widget.evaluationsStepsService.getFormTypes().then((value) {
      if (value != null) {
        evalFormTypes.value = value;
        selectedEvalForm.value = value[0];
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectEvalForm(DropDownModel value) {
    selectedEvalForm.value = value;
    widget.onSelect(value);
  }
}
