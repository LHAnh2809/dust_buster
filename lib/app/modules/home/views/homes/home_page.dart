import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/modules/home/views/widgets/blog_widget.dart';
import 'package:dust_buster/app/routes/app_pages.dart';

import '../../exports.dart';

class HomePage extends StatelessWidget {
  final HomeModel? model;
  final HomeController controller;
  const HomePage({Key? key, required this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderView(
            onTapLocation: () {
              Get.toNamed(Routes.location);
            },
            onTapWallet: () {
              Get.toNamed(Routes.cleanWallet);
            },
            onTapPoints: () {},
            name: model?.name ?? '',
            location: model?.location ?? Strings.myLocation,
            money: model?.money.toString() ?? '',
            point: model?.gPoints.toString() ?? '',
          ),
          SlideWithIndicator(
            model: model,
            controller: controller,
          ),
          SizedBox(width: 0.0, height: 26.h),
          ServiceView(model: model, controller: controller),
          SizedBox(width: 0.0, height: 16.h),
          EndowWidget(
            name: Strings.iendow,
            onTapSeeMore: () {},
            model: model,
            controller: controller,
          ),
          BlogWidget(
            name: 'Blog',
            onTapSeeMore: () {},
            model: model,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
