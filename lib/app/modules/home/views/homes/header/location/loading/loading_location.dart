import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/homes/header/location/loading/widget/loading_location_widget.dart';

class LocationLoading extends StatelessWidget {
  const LocationLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoadingLocationWidget(),
        SizedBox(width: 0.0, height: 10.h),
        const LoadingLocationWidget(),
        SizedBox(width: 0.0, height: 10.h),
        const LoadingLocationWidget(),
      ],
    );
  }
}
