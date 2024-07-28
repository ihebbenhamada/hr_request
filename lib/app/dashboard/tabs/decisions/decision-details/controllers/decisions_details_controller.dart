import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_details_service.dart';

class DecisionsDetailsController extends BaseController {
  /// SERVICES
  final DecisionsDetailsService _decisionsDetailsService =
      DecisionsDetailsService();

  /// CONTROLLERS
  late final TextEditingController subjectTextEditingController;
  late final TextEditingController descriptionTextEditingController;

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    subjectTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
  }

  /// FUNCTIONS
  onClickDone() {
    if (subjectTextEditingController.text.isEmpty ||
        descriptionTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      AppInterceptor.showLoader();
      _decisionsDetailsService
          .createDecisions(
        fKHrEmployeeId: 0,
        fKHrDepartmentId: 1,
        subject: subjectTextEditingController.value.text,
        description: descriptionTextEditingController.value.text,
      )
          .then((value) {
        if (value != null) {
          Get.back(result: 'refresh', id: 1);
        }
        AppInterceptor.hideLoader();
      });
    }
  }

  onClickBack() {
    Get.back(id: 1);
  }
}
