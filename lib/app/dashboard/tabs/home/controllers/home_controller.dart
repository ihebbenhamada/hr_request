import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt current = 0.obs;
  RxInt currentBonusPunishments = 0.obs;
  RxInt currentMeeting = 0.obs;
  final List<Map<String, dynamic>> carouselData = [
    {
      'image': AppImages.basicSalary,
      'title': 'basic_salary',
      'value': 9000,
    },
    {
      'image': AppImages.allowances,
      'title': 'allowances',
      'value': 100,
    },
    {
      'image': AppImages.totalExtra,
      'title': 'total_extra',
      'value': 0,
    },
    {
      'image': AppImages.totalLoan,
      'title': 'total_loan',
      'value': 500,
    },
    {
      'image': AppImages.punishments,
      'title': 'punishments1',
      'value': 500,
    },
    {
      'image': AppImages.netSalary,
      'title': 'net_salary',
      'value': 12000,
    },
  ];
  final List<Map<String, dynamic>> carouselBonusPunishmentsData = [
    {
      'image': AppImages.gift,
      'title': 'bonus',
      'amount': 200.00,
      'type': 0,
    },
    {
      'image': AppImages.checkList,
      'title': 'punishments',
      'amount': 200.00,
      'type': 1,
    },
    {
      'image': AppImages.loan,
      'title': 'loan',
      'amount': 200.00,
      'type': 0,
    },
  ];
  final List<Map<String, dynamic>> carouselMeetingsData = [
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar1,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar2,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar1,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
  ];
  final List<Map<String, dynamic>> bonusPunishmentCategoryList = [
    {
      'title': 'all',
      'is_new': false,
    },
    {
      'title': 'bonus',
      'is_new': true,
    },
    {
      'title': 'punishments',
      'is_new': false,
    },
    {
      'title': 'loan',
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
