import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../../home/exports.dart';
import '../../../widgets/custom_appbar_widget.dart';
import '../../controllers/waiting_controller.dart';
import '../empt/empt_work.dart';
import '../loading/work_loading.dart';
import '../waitings/waitings_widget.dart';

class HistoryPage extends GetView<WaitingController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: 'Lịch sử',
        onBackPress: () {
          controller.getPendingInvoicee().then((value) => Get.back());
        },
      ),
      body: Container(
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () => controller.getHistoryy(),
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
                        final PendingInvoices? model =
                            state![index] as PendingInvoices?;

                        return WaitingsWidget(
                          model: model,
                          title: Utils.getLabel(
                              int.parse(model!.label.toString())),
                          controller: controller,
                        );
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
      ),
    );
  }
}
