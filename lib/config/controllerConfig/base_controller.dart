import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum ControllerStates { loading, retrieved, noData, error }

class BaseController extends GetxController {
  ControllerStates state = ControllerStates.loading;

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
  }

  @override
  @mustCallSuper
  void onReady() {
    super.onReady();
  }

  @override
  @mustCallSuper
  void onClose() {
    super.onClose();
  }

  @override
  @mustCallSuper
  get onStart => super.onStart;

  void loadingState() {
    state = ControllerStates.loading;
    update();
  }

  void noDataState() {
    state = ControllerStates.noData;
    update();
  }

  void successState() {
    state = ControllerStates.retrieved;

    update();
  }

  void errorState() {
    state = ControllerStates.error;
    update();
  }

  void showLoading() {
    EasyLoading.show(status: 'Chargement en cours...');
    loadingState();
  }

  void dismissLoading() {
    EasyLoading.dismiss();
  }
}
