import 'package:dust_buster/app/common/util/shimmer.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

class LoadingLocationWidget extends StatelessWidget {
  const LoadingLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 343.w,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).r,
      decoration: BoxDecoration(
          color: AppColors.kBackgroundColor,
          border: Border.all(color: AppColors.kBackgroundColor, width: 0.5),
          borderRadius: 10.borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customShimmer(width: 24.w, height: 24.h),
          SizedBox(
            width: 259.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customShimmer(width: 67.w, height: 16.h),
                    SizedBox(width: 8.w, height: 0.0),
                    customShimmer(width: 61.w, height: 12.h),
                  ],
                ),
                SizedBox(width: 0.0, height: 4.h),
                customShimmer(width: 259.w, height: 27.h),
              ],
            ),
          ),
          customShimmer(width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
