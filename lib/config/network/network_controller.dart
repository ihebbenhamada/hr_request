import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() {
    /*initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);*/
    super.onInit();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  /* Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    result.forEach((element) {
      log(element.name);
    });
    if (result.contains(ConnectivityResult.none)) {
      Get.showSnackbar(
        GetSnackBar(
          messageText: Text(
            'PLEASE CONNECT TO THE INTERNET',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
            ),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: AppColors.redLight,
          icon: const Icon(
            Icons.wifi_off,
            color: AppColors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED,
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }*/
}
