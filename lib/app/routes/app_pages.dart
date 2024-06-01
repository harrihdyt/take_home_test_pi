import 'package:get/get.dart';

import 'package:take_home_test_pi/app/modules/home/bindings/home_binding.dart';
import 'package:take_home_test_pi/app/modules/home/views/home_view.dart';
import 'package:take_home_test_pi/app/modules/profile/bindings/profile_binding.dart';
import 'package:take_home_test_pi/app/modules/profile/views/profile_view.dart';
import 'package:take_home_test_pi/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:take_home_test_pi/app/modules/splash_screen/views/splash_screen_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
