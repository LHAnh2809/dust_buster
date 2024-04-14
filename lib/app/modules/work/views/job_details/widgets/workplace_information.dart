import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../common/util/exports.dart';
import '../../../../../data/models/pending_invoices_models/pending_invoices.dart';


class WorkplaceInformation extends StatelessWidget {
  final PendingInvoices model;
  const WorkplaceInformation({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin chổ làm',
            style: AppTextStyle.textbodyStyle,
          ),
          SizedBox(width: 0.0, height: 16.h),
          JobDetailsWidget(
            image: AppImages.iconDate,
            text: model.workingDay.toString(),
          ),
          SizedBox(width: 0.0, height: 12.h),
          JobDetailsWidget(
            image: AppImages.iconTime,
            text: model.workTime.toString(),
          ),
          if (model.repeat.toString() != '')
            Column(
              children: [
                SizedBox(width: 0.0, height: 12.h),
                JobDetailsWidget(
                  image: AppImages.iconRepeat,
                  text: model.repeat.toString(),
                ),
              ],
            ),
          SizedBox(width: 0.0, height: 12.h),
          JobDetailsWidget(
            image: AppImages.iconLocation2,
            text: model.location.toString(),
          ),
          SizedBox(width: 0.0, height: 12.h),
          JobDetailsWidget(
            image: AppImages.iconsUserLocation,
            color: AppColors.kGray400Color,
            text: '${model.nameU} - ${model.phoneNumber}',
          ),
        ],
      ),
    );
  }
}
