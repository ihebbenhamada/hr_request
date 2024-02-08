import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/screen/dashboard-screen.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/home/screens/home_screen.dart';
import 'package:request_hr/app/dashboard/tabs/mail/screens/mail_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/screens/meetings_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/screens/vacations_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';

import '../app/auth/login/screens/login_screen.dart';
import '../app/dashboard/tabs/decisions/main/screens/decisions_screen.dart';
import 'app_bindings.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginPageBindings(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardPageBindings(),
    ),
    GetPage(
      name: AppRoutes.decisions,
      page: () => DecisionsScreen(),
      binding: DecisionsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.vacations,
      page: () => VacationsScreen(),
      binding: VacationPageBindings(),
    ),
    GetPage(
      name: AppRoutes.vacationsForm,
      page: () => VacationsFormScreen(),
      binding: VacationsFormPageBindings(),
    ),
    GetPage(
      name: AppRoutes.vacationsSteps,
      page: () => VacationsStepsScreen(),
      binding: VacationsStepsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.successVacation,
      page: () => SuccessVacationScreen(),
      binding: SuccessVacationPageBindings(),
    ),
    GetPage(
      name: AppRoutes.meetings,
      page: () => MeetingsScreen(),
      binding: MeetingsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.mail,
      page: () => MailScreen(),
      binding: MailPageBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomePageBindings(),
    ),
    GetPage(
      name: AppRoutes.decisionsDetails,
      page: () => DecisionsDetailsScreen(),
      binding: DecisionsDetailsPageBindings(),
    ),
  ];
}
