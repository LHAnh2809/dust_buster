import 'package:dust_buster/app/modules/home/bindings/wallet_binding.dart';
import 'package:dust_buster/app/modules/home/views/homes/wallet/wallet_page.dart';
import '../modules/create_account/exports.dart';
import '../modules/forgot_password/exports.dart';
import '../modules/home/bindings/cleaning_binding.dart';
import '../modules/home/exports.dart';
import '../modules/login/exports.dart';
import '../modules/navigation_bar/exports.dart';
import '../modules/notification/views/job_details/job_details_page.dart';
import '../modules/splash/exports.dart';
part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.splash,
      transition: Transition.rightToLeftWithFade,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      transition: Transition.fadeIn,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.createAccount,
      transition: Transition.rightToLeftWithFade,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      transition: Transition.rightToLeftWithFade,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.navigationBar,
      transition: Transition.fadeIn,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.location,
      transition: Transition.rightToLeftWithFade,
      page: () => const LocationView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.findLocation,
      transition: Transition.rightToLeftWithFade,
      page: () => const FindLocationView(),
      binding: FindLocationBinding(),
    ),
    GetPage(
      name: _Paths.cleaningHouer,
      transition: Transition.rightToLeftWithFade,
      page: () => const CleaningHoursPage(),
      binding: CleaningBinding(),
    ),
    GetPage(
      name: _Paths.promotionDetails,
      transition: Transition.rightToLeftWithFade,
      page: () => const PromotionDetailsPage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.jobDetailss,
      transition: Transition.rightToLeftWithFade,
      page: () => const JobDetailsPagee(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.cleanWallet,
      transition: Transition.fadeIn,
      page: () => const WalletPage(),
      binding: WalletBinding(),
    ),
  ];
}
