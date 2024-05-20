import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/work/views/empt/empt_work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/periodic_models/Periodic.dart';
import '../../../widgets/custom_not_found_widget.dart';
import '../../controllers/periodic_controller.dart';
import '../loading/work_loading.dart';
import 'waitings/waitings_widget.dart';

class ByPackagePage extends StatelessWidget {
  const ByPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PeriodicController());
    return Container(
      color: Colors.white,
      // child: RefreshIndicator(
      //   onRefresh: () => controller.getPendingInvoicee(),
      child: RefreshIndicator(
        onRefresh: () => controller.getPeriodicallyy(),
        child: ListView(
          // physics: const ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16).r,
              child: controller.obx(
                (state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final Periodic? model = state![index] as Periodic?;

                      if (model!.repeatState == 1) {
                        return WaitingsWidget(
                          model: model,
                          title:
                              Utils.getLabel(int.parse(model.label.toString())),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 0.0, height: 8.h),
                  );
                },
                onLoading: const WorkLoading(),
                onEmpty: Padding(
                  padding: const EdgeInsets.only(top: 200).r,
                  child: const EmptWork(),
                ),
                onError: (error) => Center(
                    child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
