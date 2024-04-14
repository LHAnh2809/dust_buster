import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/util/exports.dart';

class WalletEmpty extends StatelessWidget {
  const WalletEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15).r,
            height: 104,
            width: 104,
            decoration: BoxDecoration(
              color: AppColors.kGray100Color,
              borderRadius: BorderRadius.circular(88).r,
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.kBrightPurpleColor,
                    AppColors.kDarkPurpleColor,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: SizedBox(
                height: 56.h,
                width: 56.w,
                child: SvgPicture.asset(
                  AppImages.iconWork,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 0.0, height: 16.h),
          Text(
            textAlign: TextAlign.center,
            'Bạn chưa có giao dịch nào',
            style: AppTextStyle.lableBodyStyle,
          ),
          SizedBox(width: 0.0, height: 8.h),
          Text(
            textAlign: TextAlign.center,
            'Nạp tiền vào ví hoặc liên kết với thẻ ngân hàng của bạn để tận hưởng những tiện ích và khuyến mãi đầy hấp dẫn từ 3Clean.',
            style: AppTextStyle.textsmallStyle.copyWith(
              color: AppColors.kGray500Color,
            ),
          ),
        ],
      ),
    );
  }
}
