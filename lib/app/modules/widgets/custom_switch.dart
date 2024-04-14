import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  final RxBool? value;
  final Function(bool) onToggle;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 40.w,
      height: 24.h,
      padding: 2.r,
      value: value?.value ?? false,
      toggleColor: AppColors.white,
      activeColor: AppColors.kGray1000Color,
      inactiveColor: AppColors.kGray300Color,
      onToggle: onToggle,
    );
  }
}
