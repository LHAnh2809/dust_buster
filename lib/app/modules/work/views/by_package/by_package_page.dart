import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/work/views/empt/empt_work.dart';
import 'package:flutter/material.dart';

class ByPackagePage extends StatelessWidget {
  const ByPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // child: RefreshIndicator(
      //   onRefresh: () => controller.getPendingInvoicee(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 200).r,
                child: const EmptWork()),
            // controller.obx(
            //   (state) {
            //     return ListView.separated(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: state?.length ?? 0,
            //       itemBuilder: (BuildContext context, int index) {
            //         final PendingInvoices? model =
            //             state![index] as PendingInvoices?;

            //         return WaitingsWidget(
            //             model: model!, controller: controller);
            //       },
            //       separatorBuilder: (context, index) =>
            //           SizedBox(width: 0.0, height: 8.h),
            //     );
            //   },
            //   onLoading: const WorkLoading(),
            //   onEmpty: Padding(
            //       padding: const EdgeInsets.only(top: 200).r,
            //       child: const EmptWork()),
            //   onError: (error) => Center(
            //       child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
            // ),
          ],
        ),
        // ),
      ),
    );
  }
}
