import 'package:dust_buster/app/data/models/viet_map_models/auto_complete/auto_complete_model.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

import '../../../../../../widgets/custom_empty_widget.dart';

class FindLocationView extends GetView<FindLocationController> {
  // ignore: use_super_parameters
  const FindLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: Icon(
            Ionicons.arrow_back_outline,
            size: 24.sp,
          ),
        ),
        title: Text(
          Strings.findLocation,
          style: AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SearchPage(controller: controller),
              Padding(
                padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 16)
                    .r,
                child: controller.obx(
                  (state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final AutoCompleteModel? model = state?[index];
                        return ListLocation(
                            model: model, controller: controller);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 0.0, height: 8.h),
                    );
                  },
                  onLoading: const FindLocationLoading(),
                  onEmpty: Center(child: CustomEmptyWidget(top: 0.12.sh)),
                  onError: (error) => Center(
                      child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                BottomLocationPage(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
