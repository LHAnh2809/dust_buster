import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/notification/controllers/calendar_controller.dart';
import 'package:dust_buster/app/modules/work/controllers/job_details_controller.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
// import 'package:dust_buster/app/modules/work/controllers/waiting_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/models/job_details_models/job_details.dart';
import '../../../home/exports.dart';
import '../../../work/views/empt/empt_work.dart';
import '../../../work/views/loading/work_loading.dart';
import '../../../work/views/widgets/cancel_job_widget.dart';
import 'widgets/job_acceptance_status.dart';
import 'widgets/job_details.dart';
import 'widgets/payment_methods.dart';
import 'widgets/priority_list.dart';
import 'widgets/workplace_information.dart';

class JobDetailsPagee extends GetView<JobDetailsController> {
  const JobDetailsPagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.find();
    // final WaitingController waitingController = Get.find();
    // waitingController.getPendingInvoicee();
    final Map<String, dynamic>? args = Get.arguments;
    String title = "";
    String id = "";
    if (args != null) {
// Truy cập các giá trị từ Map
      title = args["title"];
      id = args["id"];
    }

    print(id);

    controller.getJobDetailss(id);

    return Scaffold(
      backgroundColor: AppColors.kGray050Color,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              calendarController.getNotificationCalendarr();
              Get.back();
            },
            child: SvgPicture.asset(
              AppImages.iconBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
          SizedBox(width: 16.w)
        ],
        title: Center(
          child: Text(
            title,
            style:
                AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
          ),
        ),
      ),
      // body: controller.obx(
      //   (state) {
      //     JobDetails? model = state;
      //     return ListView(
      //       physics: const ClampingScrollPhysics(),
      //       children: [
      //         SizedBox(width: 0.0, height: 8.h),
      //         JobAcceptanceStatus(
      //           id: model!.idPT?.toString() ?? '',
      //           name: model.namePT?.toString() ?? '',
      //           oneStar: int.tryParse(model.oneStar?.toString() ?? '0') ?? 0,
      //           twoStar: int.tryParse(model.twoStar?.toString() ?? '0') ?? 0,
      //           threeStar:
      //               int.tryParse(model.threeStar?.toString() ?? '0') ?? 0,
      //           fourStar: int.tryParse(model.fourStar?.toString() ?? '0') ?? 0,
      //           fiveStar: int.tryParse(model.fiveStar?.toString() ?? '0') ?? 0,
      //           image: model.imagePT?.toString() ?? '',
      //         ),
      //         if (model.partner![0].idP != null)
      //           Column(
      //             children: [
      //               SizedBox(width: 0.0, height: 8.h),
      //               PriorityList(model: model.partner ?? []),
      //             ],
      //           ),
      //         SizedBox(width: 0.0, height: 8.h),
      //         WorkplaceInformation(model: model),
      //         SizedBox(width: 0.0, height: 8.h),
      //         JobDetailss(model: model),
      //         SizedBox(width: 0.0, height: 8.h),
      //         PaymentMethods(model: model),
      //         Padding(
      //           padding: const EdgeInsets.all(16).r,
      //           child: Column(
      //             children: [
      //               ButtonWidget(
      //                 onTap: () {},
      //                 text: 'Thay đổi yêu cầu',
      //                 colorBackGroud: AppColors.white,
      //                 boder: true.obs,
      //                 textStyle: AppTextStyle.textButtonStyle.copyWith(
      //                   color: AppColors.black,
      //                 ),
      //               ),
      //               SizedBox(width: 0.0, height: 8.h),
      //               ButtonWidget(
      //                 onTap: () {
      //                   controller.formatTime(model.workingDay.toString(),
      //                       model.workTime.toString());
      //                   final WaitingController waitingController =
      //                       Get.put(WaitingController());
      //                   goPresent(children: [
      //                     CancelJobWidget(
      //                       controller: waitingController,
      //                     ),
      //                   ]);
      //                 },
      //                 text: 'Huỷ việc',
      //                 colorBackGroud: AppColors.kGray050Color,
      //                 textStyle: AppTextStyle.textButtonStyle.copyWith(
      //                   color: AppColors.kRrror400Color,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     );
      //   },
      //   onLoading: Padding(
      //     padding: const EdgeInsets.only(left: 16).r,
      //     child: const WorkLoading(),
      //   ),
      //   onEmpty: Padding(
      //       padding: const EdgeInsets.only(left: 16, top: 200).r,
      //       child: const EmptWork()),
      //   onError: (error) =>
      //       Center(child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
      // ),
    );
  }
}
