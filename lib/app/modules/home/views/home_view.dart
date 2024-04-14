import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/modules/home/views/homes/home_page.dart';
import 'package:dust_buster/app/modules/home/views/homes/loading/home_loading.dart';
import '../exports.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:ionicons/ionicons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchCurrentLocation();
    return Scaffold(
        backgroundColor: AppColors.white,
        body: RefreshIndicator(
          onRefresh: () => controller.getHomePage(),
          child: SingleChildScrollView(
            child: controller.obx(
              (state) {
                HomeModel? model = state;
                return HomePage(model: model, controller: controller);
              },
              onLoading: const Padding(
                padding: EdgeInsets.all(16),
                child: HomeLoading(),
              ),
              onEmpty: const Center(child: EmptLocationPage()),
              onError: (error) => Center(
                child: CustomNotFoundWidget(error: error, top: 0.18.sh),
              ),
            ),
          ),
        ));
  }
}
