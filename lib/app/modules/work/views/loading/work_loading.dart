import 'package:dust_buster/app/common/util/shimmer.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

class WorkLoading extends StatelessWidget {
  const WorkLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customShimmer(width: 343.w, height: 343.h),
        SizedBox(width: 0, height: 16.h),
        customShimmer(width: 343.w, height: 343.h),
      ],
    );
  }
}
