import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../home/exports.dart';
import '../../../widgets/custom_svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = '';
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: "Hồ sơ",
      ),
      body: Column(
        children: [
          Stack(
            children: [
              if (image != "")
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.kGray200Color,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              if (image == "")
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.kGray200Color,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3),
                  ),
                  child: SvgPicture.asset(
                    AppImages.iconAvtUser,
                    fit: BoxFit.cover,
                    width: 41.w,
                    height: 41.h,
                  ),
                ),
              if (image == "")
                Positioned(
                  top: 32.h,
                  left: 32.w,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    padding: const EdgeInsets.all(1).r,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0a000000).withOpacity(0.06),
                            offset: const Offset(0, 2),
                            blurRadius: 4.r,
                            spreadRadius: -1.r,
                          ),
                          BoxShadow(
                            color: const Color(0x0a000000).withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 6.r,
                            spreadRadius: -1.r,
                          ),
                        ]),
                    child: SvgPicture.asset(
                      AppImages.iconsShieldStarFill,
                      fit: BoxFit.cover,
                      color: AppColors.kSuccess600Color,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
