import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation_form.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../../config/colors/colors.dart';
import '../../../../../api/models/public/department.dart';
import '../../../../../api/models/public/employee.dart';
import '../../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../../steps/employee.dart';
import '../../steps/form_a.dart';
import '../../steps/form_type.dart';
import '../../steps/recommendation.dart';
import '../services/evaluations_steps_service.dart';

class EvaluationsStepsController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final EvaluationsStepsService _evaluationsStepsService =
      EvaluationsStepsService();

  /// CONTROLLERS
  final PageController pageController = PageController(initialPage: 0);
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  /// VARIABLES
  final RxDouble animatedFirstStepBarWidth = 0.0.obs;
  final RxDouble animatedSecondStepBarWidth = 0.0.obs;
  final RxDouble animatedThirdStepBarWidth = 0.0.obs;

  final RxInt activePage = 0.obs;
  final Rx<Color> firstStepTextColor = AppColors.blueDark.obs;
  final Rx<Color> secondStepTextColor = AppColors.blueDark.obs;
  final Rx<Color> thirdStepTextColor = AppColors.blueDark.obs;

  ///area1
  final RxString workPlaceFactoryTitle = ''.obs;
  final RxString workPlaceDesc1 = ''.obs;
  final RxString workPlaceDesc2 = ''.obs;
  final RxDouble jobDescSliderValue = 0.0.obs;
  final RxDouble importantRoleValue = 0.0.obs;

  ///area2
  final RxString relationShipCollageTitle = ''.obs;
  final RxString relationShipDesc1 = ''.obs;
  final RxString relationShipDesc2 = ''.obs;
  final RxString relationShipDesc3 = ''.obs;
  final RxDouble managementEncourageValue = 0.0.obs;
  final RxDouble memberQualifiedValue = 0.0.obs;
  final RxDouble discusesJobDutiesValue = 0.0.obs;

  ///area3
  final RxString managementDepartmentTitle = ''.obs;
  final RxString managementDepartmentDesc = ''.obs;
  final RxDouble helpManagingWorkValue = 0.0.obs;

  ///area4
  final RxString directManagementTitle = ''.obs;
  final RxString directManagementDesc = ''.obs;
  final RxDouble understandManagerExpectationValue = 0.0.obs;

  final RxDouble totalScale = 0.0.obs;

  List<RecommendationItem> recItemsList = [];
  //////////

  late AnimationController _animationFirstStepContainer;
  late Animation<double> firstStepContainerAnimation;

  late AnimationController _animationSecondStepContainer;
  late Animation<double> secondStepContainerAnimation;

  late AnimationController _animationThirdStepContainer;
  late Animation<double> thirdStepContainerAnimation;

  RxList<Widget> steps = <Widget>[].obs;

  final RxString selectedType = 'Annual'.obs;
  final Rx<EvaluationForm> evaluationFormData = EvaluationForm().obs;
  final Rx<DropDownModel> selectedEvalForm = DropDownModel(
    value: "0",
  ).obs;

  Rx<Department> selectedDepartment = Department(id: 0).obs;
  Rx<Employee> selectedEmployee = Employee(id: 0).obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    _animationFirstStepContainer.dispose();
    _animationSecondStepContainer.dispose();
    _animationThirdStepContainer.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    _animationFirstStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationSecondStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationThirdStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    firstStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationFirstStepContainer);
    secondStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationSecondStepContainer);
    thirdStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationThirdStepContainer);
    steps.value = [
      FormType(
        evaluationsStepsService: _evaluationsStepsService,
        onSelect: (DropDownModel selectedEval) =>
            onSelectEvalForm(selectedEval),
        onSelectDep: onSelectDep,
        onSelectEmp: onSelectEmp,
      ),
      FormA(
        jobDescSliderValue: jobDescSliderValue,
        onChangeSlider: (value, type) => onChangeSlider(value, type),
        importantRoleValue: importantRoleValue,
        managementEncourageValue: managementEncourageValue,
        memberQualifiedValue: memberQualifiedValue,
        discusesJobDutiesValue: discusesJobDutiesValue,
        helpManagingWorkValue: helpManagingWorkValue,
        understandManagerExpectationValue: understandManagerExpectationValue,
        workPlaceFactoryTitle: workPlaceFactoryTitle,
        relationShipCollageTitle: relationShipCollageTitle,
        managementDepartmentTitle: managementDepartmentTitle,
        directManagementTitle: directManagementTitle,
        workPlaceDesc1: workPlaceDesc1,
        workPlaceDesc2: workPlaceDesc2,
        relationShipDesc1: relationShipDesc1,
        relationShipDesc2: relationShipDesc2,
        relationShipDesc3: relationShipDesc3,
        managementDepartmentDesc: managementDepartmentDesc,
        directManagementDesc: directManagementDesc,
        totalScale: totalScale,
      ),
      Recommendation(
        recItemsList: recItemsList,
        onCheckBox: onCheckBox,
      ),
      const EmployeePart(),
    ];
  }

  /// FUNCTIONS
  onClickNext() {
    if (activePage < steps.length - 1) {
      if (activePage.value == 0) {
        if (selectedEvalForm.value.value != "0" &&
            selectedEmployee.value.id != 0) {
          AppInterceptor.showLoader();
          _evaluationsStepsService
              .getFormData(selectedEvalForm.value.value ?? '')
              .then((value) {
            if (value != null) {
              evaluationFormData.value = value;

              ///area1
              workPlaceFactoryTitle.value =
                  value.evaluationMainItems![0].nameEn;
              workPlaceDesc1.value = value
                  .evaluationMainItems![0].evaluationItems[0].evaluationItemEn;
              workPlaceDesc2.value = value
                  .evaluationMainItems![0].evaluationItems[1].evaluationItemEn;

              ///area2
              relationShipCollageTitle.value =
                  value.evaluationMainItems![1].nameEn;
              relationShipDesc1.value = value
                  .evaluationMainItems![1].evaluationItems[0].evaluationItemEn;
              relationShipDesc2.value = value
                  .evaluationMainItems![1].evaluationItems[1].evaluationItemEn;
              relationShipDesc3.value = value
                  .evaluationMainItems![1].evaluationItems[2].evaluationItemEn;

              ///area3
              managementDepartmentTitle.value =
                  value.evaluationMainItems![2].nameEn;
              managementDepartmentDesc.value = value
                  .evaluationMainItems![2].evaluationItems[0].evaluationItemEn;

              ///area4
              directManagementTitle.value =
                  value.evaluationMainItems![3].nameEn;
              directManagementDesc.value = value
                  .evaluationMainItems![3].evaluationItems[0].evaluationItemEn;
              log(value.recommendationItems!.length.toString());
              recItemsList = value.recommendationItems!;
              steps.value = [
                FormType(
                  evaluationsStepsService: _evaluationsStepsService,
                  onSelect: (DropDownModel selectedEval) =>
                      onSelectEvalForm(selectedEval),
                  onSelectDep: onSelectDep,
                  onSelectEmp: onSelectEmp,
                ),
                FormA(
                  jobDescSliderValue: jobDescSliderValue,
                  onChangeSlider: (value, type) => onChangeSlider(value, type),
                  importantRoleValue: importantRoleValue,
                  managementEncourageValue: managementEncourageValue,
                  memberQualifiedValue: memberQualifiedValue,
                  discusesJobDutiesValue: discusesJobDutiesValue,
                  helpManagingWorkValue: helpManagingWorkValue,
                  understandManagerExpectationValue:
                      understandManagerExpectationValue,
                  workPlaceFactoryTitle: workPlaceFactoryTitle,
                  relationShipCollageTitle: relationShipCollageTitle,
                  managementDepartmentTitle: managementDepartmentTitle,
                  directManagementTitle: directManagementTitle,
                  workPlaceDesc1: workPlaceDesc1,
                  workPlaceDesc2: workPlaceDesc2,
                  relationShipDesc1: relationShipDesc1,
                  relationShipDesc2: relationShipDesc2,
                  relationShipDesc3: relationShipDesc3,
                  managementDepartmentDesc: managementDepartmentDesc,
                  directManagementDesc: directManagementDesc,
                  totalScale: totalScale,
                ),
                Recommendation(
                  recItemsList: value.recommendationItems!,
                  onCheckBox: onCheckBox,
                ),
                const EmployeePart(),
              ];
              update();

              paginate(activePage.value + 1, true);
              animateFirstStep('forward');
            }
            AppInterceptor.hideLoader();
          });
        }
        return;
      }
      if (activePage.value == 1) {
        paginate(activePage.value + 1, true);
        animateSecondStep('forward');
        return;
      }
      if (activePage.value == 2) {
        paginate(activePage.value + 1, true);
        animateThirdStep('forward');
        return;
      }
    }
  }

  onClickBack() {
    if (activePage.value > 0) {
      paginate(activePage.value - 1, false);
      if (activePage.value == 3) {
        animateThirdStep('back');
        return;
      }
      if (activePage.value == 2) {
        animateSecondStep('back');
        return;
      }
      selectedEvalForm.value = DropDownModel(value: '0');
      animateFirstStep('back');
    } else {
      Get.back();
    }
  }

  onClickFinish() {
    _evaluationsStepsService
        .createEvaluation(
      fKEvaluationFormId: int.parse(selectedEvalForm.value.value ?? '0'),
      fKEvaluatedById: selectedEmployee.value.id,
      evaluatedByName: selectedEmployee.value.fullName ?? '',
      evaluatedByNameEn: selectedEmployee.value.fullNameEn ?? "",
      submitType: 'btnSend',
      formName: selectedEvalForm.value.text ?? '',
      formNameEn: selectedEvalForm.value.text ?? '',
      fKEvaluatedEmployeeId: selectedEmployee.value.id,
      evaluatedEmployeeName: selectedEmployee.value.fullName ?? '',
      evaluatedEmployeeNameEn: selectedEmployee.value.fullNameEn ?? '',
      evaluationDate: DateTime.now().toString().substring(0, 10),
      fKCreatorId: evaluationFormData.value.fKCreatorId ?? 0,
      fKReqStatusId: evaluationFormData.value.fKReqStatusId ?? 0,
      creationDate: evaluationFormData.value.creationDate ??
          DateTime.now().toString().substring(0, 10),
      lastModifiedDate: evaluationFormData.value.lastModifiedDate ??
          DateTime.now().toString().substring(0, 10),
      isActive: evaluationFormData.value.isActive ?? true,
      isDeleted: evaluationFormData.value.isDeleted ?? false,
      isEmployeeApprove: evaluationFormData.value.isEmployeeApprove ?? false,
      employeeApproveDate: evaluationFormData.value.employeeApproveDate ??
          DateTime.now().toString().substring(0, 10),
      employeeNotes: evaluationFormData.value.employeeNotes ?? '',
      employeeSigniture: evaluationFormData.value.employeeSigniture ?? '',
      employeeName: evaluationFormData.value.employeeName ?? '',
      fKHrEvaluationFormItemId:
          int.parse(selectedEvalForm.value.value.toString()),
      fKHrEvaluationScaleId: 1,
      degreeScale: totalScale.value,
      recommendationText: '',
      fKDetailCreatorId: 1,
      detailCreationDate: DateTime.now().toString().substring(0, 10),
      detailLastModifiedDate: DateTime.now().toString().substring(0, 10),
      detailIsDeleted: false,
    )
        .then((value) {
      if (value != null) {
        Get.to(
          () => SuccessVacationScreen(),
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  paginate(int index, bool isForward) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
    Future.delayed(Duration(milliseconds: isForward ? 600 : 200), () {
      firstStepTextColor.value =
          index != 0 ? AppColors.white : AppColors.blueDark;
      secondStepTextColor.value =
          index != 1 && index != 0 ? AppColors.white : AppColors.blueDark;
      thirdStepTextColor.value =
          index != 3 ? AppColors.blueDark : AppColors.white;
    });
  }

  onPageChanged(int index) {
    activePage.value = index;
  }

  animateFirstStep(String direction) {
    if (direction == 'forward') {
      animatedFirstStepBarWidth.value = (Get.mediaQuery.size.width - 170.w) / 4;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationFirstStepContainer.forward();
      });
    } else {
      _animationFirstStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedFirstStepBarWidth.value = 0.0;
      });
    }
  }

  animateSecondStep(String direction) {
    if (direction == 'forward') {
      animatedSecondStepBarWidth.value =
          (Get.mediaQuery.size.width - 170.w) / 4;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationSecondStepContainer.forward();
      });
    } else {
      _animationSecondStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedSecondStepBarWidth.value = 0.0;
      });
    }
  }

  animateThirdStep(String direction) {
    if (direction == 'forward') {
      animatedThirdStepBarWidth.value = (Get.mediaQuery.size.width - 170.w) / 4;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationThirdStepContainer.forward();
      });
    } else {
      _animationThirdStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedThirdStepBarWidth.value = 0.0;
      });
    }
  }

  onChangeSlider(dynamic value, int type) {
    switch (type) {
      case 1:
        jobDescSliderValue.value = value;
        break;
      case 2:
        importantRoleValue.value = value;
        break;
      case 3:
        managementEncourageValue.value = value;
        break;
      case 4:
        memberQualifiedValue.value = value;
        break;
      case 5:
        discusesJobDutiesValue.value = value;
        break;
      case 6:
        helpManagingWorkValue.value = value;
        break;
      case 7:
        understandManagerExpectationValue.value = value;
        break;
      default:
        importantRoleValue.value = value;
        break;
    }
    totalScale.value = jobDescSliderValue.value +
        importantRoleValue.value +
        managementEncourageValue.value +
        memberQualifiedValue.value +
        discusesJobDutiesValue.value +
        helpManagingWorkValue.value +
        understandManagerExpectationValue.value;
  }

  onSelectEvalForm(DropDownModel value) {
    selectedEvalForm.value = value;
  }

  onCheckBox(int id, bool value) {
    recItemsList.firstWhere((test) => test.id == id).checked = value;
    update();
  }

  onSelectDep(Department value) {
    selectedDepartment.value = value;
  }

  onSelectEmp(Employee value) {
    selectedEmployee.value = value;
  }
}
