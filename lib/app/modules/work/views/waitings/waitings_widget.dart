import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:dust_buster/app/modules/work/views/widgets/order_status.dart';

import '../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../exports.dart';
import '../job_details/job_details_page.dart';

class WaitingsWidget extends StatelessWidget {
  final PendingInvoices? model;
  final String title;
  final WaitingController controller;
  const WaitingsWidget(
      {Key? key,
      required this.model,
      required this.title,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => JobDetailsPage(model: model!));
      },
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.kGray100Color,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 6.r,
              spreadRadius: -2,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              blurRadius: 15.r,
              spreadRadius: -3,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: AppTextStyle.lableBodyStyle,
                    ),
                  ),
                  OrderStatus(
                    status: int.parse(model!.orderStatus.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 15).r,
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: SvgPicture.asset(
                      AppImages.iconAccessTime,
                      fit: BoxFit.cover,
                      color: AppColors.kGray500Color,
                    ),
                  ),
                  SizedBox(width: 4.w, height: 0.0),
                  Text(
                    Utils.formatTimeAgo(model!.postingTime.toString()),
                    style: AppTextStyle.textxsmallStyle.copyWith(
                      color: AppColors.kGray500Color,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.kGray100Color,
              height: 1.h,
            ),
            if (model!.premiumService == 1)
              Column(
                children: [
                  SizedBox(width: 0.0, height: 16.h),
                  Container(
                    alignment: Alignment.center,
                    width: 343.w,
                    height: 40.h,
                    padding: const EdgeInsets.all(8).r,
                    margin: const EdgeInsets.only(left: 16, right: 16).r,
                    decoration: BoxDecoration(
                      color: AppColors.kWarning050Color,
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.iconVipCrown2,
                          width: 24.w,
                          height: 24.h,
                          color: AppColors.kYellowColor,
                        ),
                        SizedBox(width: 8.w, height: 0.0),
                        Text(
                          "Dịch vụ Premium",
                          style: AppTextStyle.textbodyStyle,
                        ),
                        SizedBox(width: 4.w, height: 0.0),
                      ],
                    ),
                  ),
                ],
              ),
            Container(
              padding: const EdgeInsets.all(16).r,
              child: Column(
                children: [
                  JobDetailsWidget(
                    image: AppImages.iconDate,
                    text: model!.workingDay.toString(),
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconTime,
                    text: model!.workTime.toString(),
                  ),
                  if (model!.repeatState == 1)
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconRepeat,
                          text: "${model!.repeat}",
                        ),
                        if (model!.duration != null)
                          Column(
                            children: [
                              SizedBox(width: 0.0, height: 12.h),
                              JobDetailsWidget(
                                image: AppImages.iconCalendar2Line,
                                text: "${model!.duration} ",
                                color: AppColors.kGray400Color,
                              ),
                              SizedBox(width: 0.0, height: 12.h),
                              JobDetailsWidget(
                                image: AppImages.iconRepeat,
                                text: "${model!.numberSessions} buổi",
                              ),
                            ],
                          ),
                      ],
                    ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconLocation2,
                    text: model!.location.toString(),
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconPrice,
                    text:
                        '${Utils.formatNumber(int.parse(model!.price.toString()))}đ',
                  ),
                  if (model!.employeeNotes.toString() != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Người làm",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: model!.employeeNotes.toString(),
                        ),
                      ],
                    ),
                  if (model!.petNotes.toString() != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Thú cưng",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: model!.petNotes.toString(),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (model!.idPT != "")
              Column(
                children: [
                  Container(
                    color: AppColors.kGray100Color,
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16).r,
                    child: Column(
                      children: [
                        if (model!.idPT != "")
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10.r,
                                backgroundImage:
                                    NetworkImage(model!.imagePT.toString()),
                              ),
                              SizedBox(width: 12.w, height: 0.0),
                              Text(
                                model!.namePT.toString(),
                                style: AppTextStyle.textbodyStyle,
                              )
                            ],
                          ),
                        if (model!.orderStatus == 5)
                          Column(
                            children: [
                              SizedBox(width: 0.0, height: 12.h),
                              const JobDetailsWidget(
                                image: AppImages.iconErrorWarning,
                                text: 'Bạn chưa đánh giá đối tác',
                                color: AppColors.kGray400Color,
                              ),
                            ],
                          ),
                        if (model!.partner![0].idP == null && model!.idPT == "")
                          JobDetailsWidget(
                            image: AppImages.iconAvtUser,
                            text: 'Đang chờ người nhận việc...',
                            textStyle: AppTextStyle.textbodyStyle.copyWith(
                              color: AppColors.kPurplePurpleColor,
                            ),
                          ),
                        if (model!.partner![0].idP != null)
                          Container(
                            width: 311.w,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5).r,
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < model!.partner!.length && i < 3;
                                    i++)
                                  if (model!.partner![i].imageP != null)
                                    Align(
                                      widthFactor: 0.5,
                                      child: CircleAvatar(
                                        radius: 14.r,
                                        backgroundColor: AppColors.white,
                                        child: CircleAvatar(
                                          radius: 10.r,
                                          backgroundImage: NetworkImage(model!
                                              .partner![i].imageP
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                SizedBox(width: 20.w, height: 0.0),
                                Expanded(
                                  flex: 2,
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < model!.partner!.length && i < 3;
                                          i++)
                                        if (model!.partner![i].nameP != null)
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            // ignore: prefer_interpolation_to_compose_strings
                                            '${model!.partner![i].nameP}' +
                                                (i == model!.partner!.length - 1
                                                    ? ''
                                                    : ', '),
                                            style: AppTextStyle.textbodyStyle,
                                          ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
