import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/work/controllers/waiting_controller.dart';
import 'package:dust_buster/app/modules/work/views/empt/empt_work.dart';
import 'package:dust_buster/app/modules/work/views/loading/work_loading.dart';
import 'package:dust_buster/app/modules/work/views/waitings/waitings_widget.dart';

class RepeatPage extends GetView<WaitingController> {
  const RepeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => controller.getPendingInvoicee(),
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
                      if (model!.repeatState == 1) {
                        return WaitingsWidget(
                          model: model,
                          title:
                              Utils.getLabel(int.parse(model.label.toString())),
                          controller: controller,
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
