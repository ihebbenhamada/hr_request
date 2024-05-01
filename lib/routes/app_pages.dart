import 'package:get/get.dart';
import 'package:request_hr/app/bonus/bonus-details/screens/bonus_details_screen.dart';
import 'package:request_hr/app/bonus/main/screens/bonus_screen.dart';
import 'package:request_hr/app/complaint/complaint-details/screens/complaint_details_screen.dart';
import 'package:request_hr/app/complaint/main/screens/complaint_screen.dart';
import 'package:request_hr/app/custody/custody-details/screens/custody_details_screen.dart';
import 'package:request_hr/app/custody/main/screens/custody_screen.dart';
import 'package:request_hr/app/dashboard/main/screen/dashboard-screen.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/home/screens/home_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/screens/meetings_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/screens/meetings_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/screens/vacations_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';
import 'package:request_hr/app/delete/screens/delete_screen.dart';
import 'package:request_hr/app/loan/loan-details/screens/loan_details_screen.dart';
import 'package:request_hr/app/loan/main/screens/loan_screen.dart';
import 'package:request_hr/app/mail/create-mail/screens/create_mail_screen.dart';
import 'package:request_hr/app/mail/mail-details/screens/mail_details_screen.dart';
import 'package:request_hr/app/mail/main/screens/mail_screen.dart';
import 'package:request_hr/app/mail/replay-mail/screens/replay_mail_screen.dart';
import 'package:request_hr/app/notification/screens/notifications_screen.dart';
import 'package:request_hr/app/punishments/main/screens/punishments_screen.dart';
import 'package:request_hr/app/punishments/punishments-details/screens/punishments_details_screen.dart';
import 'package:request_hr/app/purchase/main/screens/purchase_screen.dart';
import 'package:request_hr/app/purchase/purchase-details/screens/purchase_details_screen.dart';
import 'package:request_hr/app/settings/screens/settings_screen.dart';
import 'package:request_hr/app/sign-in-out/main/screens/sign_in_out_screen.dart';
import 'package:request_hr/app/sign-in-out/sign-in-out-details/screens/sign_in_out_details_screen.dart';
import 'package:request_hr/app/ticket/main/screens/ticket_screen.dart';
import 'package:request_hr/app/ticket/ticket-details/screens/ticket_details_screen.dart';

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
      children: [
        GetPage(
          name: AppRoutes.decisions,
          page: () => DecisionsScreen(),
          binding: DecisionsPageBindings(),
          children: [
            GetPage(
              name: AppRoutes.decisionsDetails,
              page: () => DecisionsDetailsScreen(),
              binding: DecisionsDetailsPageBindings(),
            ),
          ],
        ),
        GetPage(
            name: AppRoutes.vacations,
            page: () => VacationsScreen(),
            binding: VacationPageBindings(),
            children: [
              GetPage(
                name: AppRoutes.vacationsForm,
                page: () => VacationsFormScreen(),
                binding: VacationsFormPageBindings(),
              ),
            ]),
        GetPage(
          name: AppRoutes.meetings,
          page: () => MeetingsScreen(),
          binding: MeetingsPageBindings(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => HomeScreen(),
          binding: HomePageBindings(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.mail,
      page: () => MailScreen(),
      binding: MailPageBindings(),
    ),
    GetPage(
      name: AppRoutes.createMail,
      page: () => CreateMailScreen(),
      binding: CreateMailPageBindings(),
    ),
    GetPage(
      name: AppRoutes.mailDetails,
      page: () => MailDetailsScreen(),
      binding: MailDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.replyMail,
      page: () => ReplayMailScreen(),
      binding: ReplayMailPageBindings(),
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
      name: AppRoutes.meetingsDetails,
      page: () => const MeetingsDetailsScreen(),
      binding: MeetingsDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationsScreen(),
      binding: NotificationsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.loan,
      page: () => LoanScreen(),
      binding: LoanPageBindings(),
    ),
    GetPage(
      name: AppRoutes.loanDetails,
      page: () => LoanDetailsScreen(),
      binding: LoanDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.bonus,
      page: () => BonusScreen(),
      binding: BonusPageBindings(),
    ),
    GetPage(
      name: AppRoutes.bonusDetails,
      page: () => BonusDetailsScreen(),
      binding: BonusDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.punishments,
      page: () => PunishmentsScreen(),
      binding: PunishmentsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.punishmentsDetails,
      page: () => PunishmentsDetailsScreen(),
      binding: PunishmentsDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.complaint,
      page: () => ComplaintScreen(),
      binding: ComplaintPageBindings(),
    ),
    GetPage(
      name: AppRoutes.complaintDetails,
      page: () => ComplaintDetailsScreen(),
      binding: ComplaintDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.ticket,
      page: () => TicketScreen(),
      binding: TicketPageBindings(),
    ),
    GetPage(
      name: AppRoutes.ticketDetails,
      page: () {
        TicketDetailsScreen ticketDetailsPage = Get.arguments;
        return ticketDetailsPage;
      },
      binding: TicketDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.purchase,
      page: () => PurchaseScreen(),
      binding: PurchasePageBindings(),
    ),
    GetPage(
      name: AppRoutes.purchaseDetails,
      page: () => PurchaseDetailsScreen(),
      binding: PurchaseDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.custody,
      page: () => CustodyScreen(),
      binding: CustodyPageBindings(),
    ),
    GetPage(
      name: AppRoutes.custodyDetails,
      page: () {
        CustodyDetailsScreen custodyDetailsScreen = Get.arguments;
        return custodyDetailsScreen;
      },
      binding: CustodyDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.signInOut,
      page: () => SignInOutScreen(),
      binding: SignInOutPageBindings(),
    ),
    GetPage(
      name: AppRoutes.signInOutDetails,
      page: () => SignInOutDetailsScreen(),
      binding: SignInOutDetailsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsScreen(),
      binding: SettingsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.delete,
      page: () => DeleteScreen(),
      binding: DeletePageBindings(),
    ),
  ];
}
