import 'package:get/get.dart';
import 'package:request_hr/config/network/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
