import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/controllers/decisions_details_controller.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/main/controllers/decisions_controller.dart';
import 'package:request_hr/app/dashboard/tabs/home/controllers/home_controller.dart';
import 'package:request_hr/app/dashboard/tabs/mail/controllers/mail_controller.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/controllers/meetings_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/controllers/success_vacation_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/controllers/vacations_form_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/controllers/vacations_steps_controller.dart';

import '../../app/auth/login/controllers/login_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DecisionsController());
    Get.lazyPut(() => DecisionsDetailsController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MailController());
    Get.lazyPut(() => MeetingsController());
    Get.lazyPut(() => VacationsController());
    Get.lazyPut(() => VacationsFormController());
    Get.lazyPut(() => VacationsStepsController());
    Get.lazyPut(() => SuccessVacationController());
  }
}
