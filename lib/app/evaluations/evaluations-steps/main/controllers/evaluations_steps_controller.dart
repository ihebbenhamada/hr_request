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
import '../model/detail_evaluation.dart';
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
  final RxInt jobDescScaleId = 5.obs;
  final RxInt importantRoleScaleId = 5.obs;

  ///area2
  final RxString relationShipCollageTitle = ''.obs;
  final RxString relationShipDesc1 = ''.obs;
  final RxString relationShipDesc2 = ''.obs;
  final RxString relationShipDesc3 = ''.obs;
  final RxDouble managementEncourageValue = 0.0.obs;
  final RxDouble memberQualifiedValue = 0.0.obs;
  final RxDouble discusesJobDutiesValue = 0.0.obs;
  final RxInt managementEncourageScaleId = 5.obs;
  final RxInt memberQualifiedScaleId = 5.obs;
  final RxInt discusesJobDutiesScaleId = 5.obs;

  ///area3
  final RxString managementDepartmentTitle = ''.obs;
  final RxString managementDepartmentDesc = ''.obs;
  final RxDouble helpManagingWorkValue = 0.0.obs;
  final RxInt helpManagingWorkScaleId = 5.obs;

  ///area4
  final RxString directManagementTitle = ''.obs;
  final RxString directManagementDesc = ''.obs;
  final RxDouble understandManagerExpectationValue = 0.0.obs;
  final RxInt understandManagerExpectationScaleId = 5.obs;

  final RxDouble totalScale = 0.0.obs;
  final RxBool isEmployeeApprove = false.obs;
  final RxString employeeApproveDate =
      DateTime.now().toString().substring(0, 10).obs;
  final TextEditingController employeeNotesController = TextEditingController();
  final TextEditingController actionPlansController = TextEditingController();
  final TextEditingController supervisorCommentController =
      TextEditingController();
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
  RxList<DetailEvaluation> detailEvaluation = <DetailEvaluation>[].obs;

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

    firstStepContainerAnimation = Tween(
            begin: Get.locale?.languageCode == 'en' ? 0.0 : 1.0,
            end: Get.locale?.languageCode == 'en' ? 1.0 : 0.0)
        .animate(_animationFirstStepContainer);
    secondStepContainerAnimation = Tween(
            begin: Get.locale?.languageCode == 'en' ? 0.0 : 1.0,
            end: Get.locale?.languageCode == 'en' ? 1.0 : 0.0)
        .animate(_animationSecondStepContainer);
    thirdStepContainerAnimation = Tween(
            begin: Get.locale?.languageCode == 'en' ? 0.0 : 1.0,
            end: Get.locale?.languageCode == 'en' ? 1.0 : 0.0)
        .animate(_animationThirdStepContainer);
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
        empCommentController: employeeNotesController,
        actionPlansController: actionPlansController,
        supervisorCommentController: supervisorCommentController,
      ),
      EmployeePart(
        onSelectDate: () => selectDate(Get.context!),
        dateApproveEmp: employeeApproveDate.value,
        onApproveEmp: onApproveEmp,
      ),
    ];
  }

  /// FUNCTIONS
  onClickNext() {
    if (activePage < steps.length - 1) {
      if (activePage.value == 0) {
        if (selectedEvalForm.value.value != "0" &&
            selectedEmployee.value.id != 0) {
          getFormData();
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
    AppInterceptor.showLoader();
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
      isEmployeeApprove: isEmployeeApprove.value,
      employeeApproveDate: employeeApproveDate.value,
      employeeNotes: employeeNotesController.text,
      employeeSigniture: evaluationFormData.value.employeeSigniture ?? '',
      employeeName: selectedEmployee.value.fullName ?? '',
      detailEvaluationList: detailEvaluation.value,
    )
        .then((value) {
      if (value != null) {
        AppInterceptor.hideLoader();
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
        detailEvaluation[0].degreeScale = value;
        jobDescSliderValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[0].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[0].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[0].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[0].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[0].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[0].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 2:
        detailEvaluation[1].degreeScale = value;
        importantRoleValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[1].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[1].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[1].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[1].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[1].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[1].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 3:
        detailEvaluation[2].degreeScale = value;
        managementEncourageValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[2].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[2].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[2].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[2].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[2].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[2].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 4:
        detailEvaluation[3].degreeScale = value;
        memberQualifiedValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[3].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[3].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[3].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[3].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[3].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[3].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 5:
        detailEvaluation[4].degreeScale = value;
        discusesJobDutiesValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[4].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[4].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[4].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[4].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[4].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[4].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 6:
        detailEvaluation[5].degreeScale = value;
        helpManagingWorkValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[5].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[5].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[5].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[5].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[5].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[5].fkHrEvaluationScaleId = 5;
            break;
        }
        break;
      case 7:
        detailEvaluation[6].degreeScale = value;
        understandManagerExpectationValue.value = value;
        switch (value) {
          case 0.0:
            detailEvaluation[6].fkHrEvaluationScaleId = 5;
            break;
          case 25.0:
            detailEvaluation[6].fkHrEvaluationScaleId = 4;
            break;
          case 50.0:
            detailEvaluation[6].fkHrEvaluationScaleId = 3;
            break;
          case 75.0:
            detailEvaluation[6].fkHrEvaluationScaleId = 2;
            break;
          case 100.0:
            detailEvaluation[6].fkHrEvaluationScaleId = 1;
            break;
          default:
            detailEvaluation[6].fkHrEvaluationScaleId = 5;
            break;
        }
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

  onApproveEmp(bool value) {
    isEmployeeApprove.value = value;
  }

  onSelectDep(Department value) {
    selectedDepartment.value = value;
  }

  onSelectEmp(Employee value) {
    selectedEmployee.value = value;
  }

  getFormData() {
    AppInterceptor.showLoader();
    _evaluationsStepsService
        .getFormData(selectedEvalForm.value.value ?? '')
        .then((value) {
      if (value != null) {
        bool isEnglish = Get.locale?.languageCode == 'en';
        evaluationFormData.value = value;

        ///area1
        workPlaceFactoryTitle.value = isEnglish
            ? value.evaluationMainItems![0].nameEn
            : value.evaluationMainItems![0].nameAr;
        workPlaceDesc1.value = isEnglish
            ? value.evaluationMainItems![0].evaluationItems[0].evaluationItemEn
            : value.evaluationMainItems![0].evaluationItems[0].evaluationItemAr;
        workPlaceDesc2.value = isEnglish
            ? value.evaluationMainItems![0].evaluationItems[1].evaluationItemEn
            : value.evaluationMainItems![0].evaluationItems[1].evaluationItemAr;

        ///area2
        relationShipCollageTitle.value = isEnglish
            ? value.evaluationMainItems![1].nameEn
            : value.evaluationMainItems![1].nameAr;
        relationShipDesc1.value = isEnglish
            ? value.evaluationMainItems![1].evaluationItems[0].evaluationItemEn
            : value.evaluationMainItems![1].evaluationItems[0].evaluationItemAr;
        relationShipDesc2.value = isEnglish
            ? value.evaluationMainItems![1].evaluationItems[1].evaluationItemEn
            : value.evaluationMainItems![1].evaluationItems[1].evaluationItemAr;
        relationShipDesc3.value = isEnglish
            ? value.evaluationMainItems![1].evaluationItems[2].evaluationItemEn
            : value.evaluationMainItems![1].evaluationItems[2].evaluationItemAr;

        ///area3
        managementDepartmentTitle.value = isEnglish
            ? value.evaluationMainItems![2].nameEn
            : value.evaluationMainItems![2].nameAr;
        managementDepartmentDesc.value = isEnglish
            ? value.evaluationMainItems![2].evaluationItems[0].evaluationItemEn
            : value.evaluationMainItems![2].evaluationItems[0].evaluationItemAr;

        ///area4
        directManagementTitle.value = isEnglish
            ? value.evaluationMainItems![3].nameEn
            : value.evaluationMainItems![3].nameAr;
        directManagementDesc.value = isEnglish
            ? value.evaluationMainItems![3].evaluationItems[0].evaluationItemEn
            : value.evaluationMainItems![3].evaluationItems[0].evaluationItemAr;
        recItemsList = value.recommendationItems!;
        detailEvaluation.value = [
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![0]
                .evaluationItems[0].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: jobDescScaleId.value,
            degreeScale: jobDescSliderValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![0]
                .evaluationItems[1].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: importantRoleScaleId.value,
            degreeScale: importantRoleValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![1]
                .evaluationItems[0].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: managementEncourageScaleId.value,
            degreeScale: managementEncourageValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![1]
                .evaluationItems[1].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: memberQualifiedScaleId.value,
            degreeScale: memberQualifiedValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![1]
                .evaluationItems[2].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: discusesJobDutiesScaleId.value,
            degreeScale: discusesJobDutiesValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![2]
                .evaluationItems[0].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: helpManagingWorkScaleId.value,
            degreeScale: helpManagingWorkValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
          DetailEvaluation(
            fkHrEvaluationFormItemId: value.evaluationMainItems![3]
                .evaluationItems[0].fKHrEvaluationFormItemId,
            fkHrEvaluationScaleId: understandManagerExpectationScaleId.value,
            degreeScale: understandManagerExpectationValue.value,
            recommendationText: null,
            fkCreatorId: 1,
            creationDate: DateTime.now().toString().substring(0, 10),
            lastModifiedDate: DateTime.now().toString().substring(0, 10),
            isDeleted: false,
          ),
        ];

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
            empCommentController: employeeNotesController,
            actionPlansController: actionPlansController,
            supervisorCommentController: supervisorCommentController,
          ),
          EmployeePart(
            onApproveEmp: onApproveEmp,
            dateApproveEmp: employeeApproveDate.value,
            onSelectDate: () => selectDate(Get.context!),
          ),
        ];
        update();

        paginate(activePage.value + 1, true);
        animateFirstStep('forward');
      }
      AppInterceptor.hideLoader();
    });
  }

  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: TextStyle(fontSize: 14.sp),
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null &&
        pickedDate.toString().substring(0, 10) != employeeApproveDate.value) {
      employeeApproveDate.value = pickedDate.toString().substring(0, 10);
    }
  }
}
