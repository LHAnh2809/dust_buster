
import 'package:flutter/material.dart';

import '../../../../../common/util/exports.dart';
import '../../../../../data/models/job_details_models/job_details.dart';
import '../../../../work/views/widgets/job_details_widget.dart';

class JobDetailss extends StatelessWidget {
  final JobDetails model;
  const JobDetailss({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chi tiết công việc',
            style: AppTextStyle.textbodyStyle,
          ),
          SizedBox(width: 0.0, height: 16.h),
          JobDetailsWidget(
            image: AppImages.iconWork,
            text: model.roomArea.toString(),
          ),
          if (model.employeeNotes.toString() != '')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 0.0, height: 12.h),
                Text("Ghi chú cho Người làm",
                    style: AppTextStyle.textbodyStyle),
                SizedBox(width: 0.0, height: 4.h),
                JobDetailsWidget(
                  image: AppImages.iconNote,
                  text: model.employeeNotes.toString(),
                ),
              ],
            ),
          if (model.petNotes.toString() != '')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 0.0, height: 12.h),
                Text("Ghi chú cho Thú cưng", style: AppTextStyle.textbodyStyle),
                SizedBox(width: 0.0, height: 4.h),
                JobDetailsWidget(
                  image: AppImages.iconNote,
                  text: model.petNotes.toString(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
