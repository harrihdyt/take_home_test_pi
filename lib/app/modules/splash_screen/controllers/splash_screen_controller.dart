import 'package:get/get.dart';
import 'package:take_home_test_pi/app/modules/home/views/home_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    toHome();
    super.onInit();
  }

  void toHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(HomeView());
      },
    );
  }
}
