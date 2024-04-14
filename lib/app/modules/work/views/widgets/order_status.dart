import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatus extends StatelessWidget {
  final int status;
  const OrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      height: 24.h,
      decoration: BoxDecoration(
        color: Utils.getColorBackGroudStatus(int.parse(status.toString())),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: SvgPicture.asset(
              AppImages.iconAccessTime,
              fit: BoxFit.cover,
              color: Utils.getColorStatus(int.parse(status.toString())),
            ),
          ),
          SizedBox(width: 4.w, height: 0.0),
          Text(
            Utils.getLableStatus(int.parse(status.toString())),
            style: AppTextStyle.textbodyStyle.copyWith(
              color: Utils.getColorStatus(int.parse(status.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
