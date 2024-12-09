import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Observables for switches
  var isLocationEnabled = true.obs;
  var isSafeModeEnabled = true.obs;
  var isHDQualityEnabled = true.obs;

  // Functions to toggle switch values
  void toggleLocation() {
    isLocationEnabled.value = !isLocationEnabled.value;
  }

  void toggleSafeMode() {
    isSafeModeEnabled.value = !isSafeModeEnabled.value;
  }

  void toggleHDQuality() {
    isHDQualityEnabled.value = !isHDQualityEnabled.value;
  }
}
