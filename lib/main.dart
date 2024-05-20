import 'package:dust_buster/app/common/util/notification_sevice.dart';
import 'package:dust_buster/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/common/util/exports.dart';
import 'app/common/util/initializer.dart';
import 'app/data/repository/api_helper_impl.dart';
import 'app/routes/app_pages.dart';

void main() {
  Initializer.instance.init(() async {
    // WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await ApiHelperImpl().fetchDataFromFirestore();
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationService.initializeNotification();
    initializeDateFormatting('vi', null).then((_) {
      runApp(const MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        defaultTransition: Transition.fadeIn,
        initialRoute: Routes.splash,
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
