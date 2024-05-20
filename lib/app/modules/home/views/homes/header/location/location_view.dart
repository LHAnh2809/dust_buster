import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';

import '../../../../../../routes/app_pages.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: Strings.yourAddress,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: RefreshIndicator(
          onRefresh: () => controller.getLocationn(),
          child: Stack(
            children: [
              ListView(
                children: [
                  controller.obx(
                    (state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final Location? model = state![index] as Location?;

                          return ItemLocationWidget(
                            model: model,
                            controller: controller,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 0.0, height: 8.h),
                      );
                    },
                    onLoading: const LocationLoading(),
                    onEmpty: Padding(
                        padding: const EdgeInsets.only(top: 250).r,
                        child: const EmptLocationPage()),
                    onError: (error) => Center(
                        child:
                            CustomNotFoundWidget(error: error, top: 0.18.sh)),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ButtonWidget(
                  onTap: () {
                    Get.toNamed(Routes.findLocation);
                  },
                  text: Strings.addLocation,
                  boder: false.obs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
