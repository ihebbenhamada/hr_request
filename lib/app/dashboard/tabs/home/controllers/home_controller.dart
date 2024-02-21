import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();

  /// CONTROLLERS
  final CarouselController controller = CarouselController();

  /// VARIABLES
  RxInt current = 0.obs;
  RxInt currentBonusPunishments = 0.obs;
  RxInt currentMeeting = 0.obs;
  final List<Map<String, dynamic>> carouselData = [
    {
      'image': AppImages.basicSalary,
      'title': 'Basic Salary',
      'value': 9000,
    },
    {
      'image': AppImages.allowances,
      'title': 'Allowances',
      'value': 100,
    },
    {
      'image': AppImages.totalExtra,
      'title': 'Total extra',
      'value': 0,
    },
    {
      'image': AppImages.totalLoan,
      'title': 'Total loan',
      'value': 500,
    },
    {
      'image': AppImages.punishments,
      'title': 'Punishments',
      'value': 500,
    },
    {
      'image': AppImages.netSalary,
      'title': 'Net salary',
      'value': 12000,
    },
  ];
  final List<Map<String, dynamic>> carouselBonusPunishmentsData = [
    {
      'image': AppImages.gift,
      'title': 'Bonus\nAmount',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.checkList,
      'title': 'Punishments\nAmount',
      'amount': 200.00,
      'type': 1,
    },
    {
      'image': AppImages.loan,
      'title': 'Loan\nAmount',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.gift,
      'title': 'Bonus\nAmount',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.checkList,
      'title': 'Punishments\nAmount',
      'amount': 200.00,
      'type': 1,
    },
    {
      'image': AppImages.loan,
      'title': 'Loan\nAmount',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.gift,
      'title': 'Bonus\nAmount',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.checkList,
      'title': 'Punishments\nAmount',
      'amount': 200.00,
      'type': 1,
    },
    {
      'image': AppImages.loan,
      'title': 'Loan\nAmount',
      'amount': 200.00,
      'type': 0,
    },
  ];
  final List<Map<String, dynamic>> carouselMeetingsData = [
    {
      'title': 'Meeting subject',
      'image': AppImages.avatar1,
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',
      'date': '19/Dec/2023',
    },
    {
      'title': 'Meeting subject',
      'image': AppImages.avatar2,
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',
      'date': '19/Dec/2023',
    },
    {
      'title': 'Meeting subject',
      'image': AppImages.avatar1,
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',
      'date': '19/Dec/2023',
    },
  ];
  final List<Map<String, dynamic>> bonusPunishmentCategoryList = [
    {
      'title': 'All',
      'is_new': false,
    },
    {
      'title': 'Bonus',
      'is_new': true,
    },
    {
      'title': 'Punishments',
      'is_new': false,
    },
    {
      'title': 'Loan',
      'is_new': false,
    }
  ];
  RxInt selectedBonusPunishments = 0.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  onChangeCarousel(int index, CarouselPageChangedReason reason) {
    current.value = index;
  }

  onChangeBonusPunishmentsCarousel(
    int index,
    CarouselPageChangedReason reason,
  ) {
    currentBonusPunishments.value = index;
  }

  onChangeMeetingCarousel(
    int index,
    CarouselPageChangedReason reason,
  ) {
    currentMeeting.value = index;
  }

  onSelectBonusPunishment(int index) {
    selectedBonusPunishments.value = index;
  }
}
