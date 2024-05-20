import 'package:dust_buster/app/modules/notification/exports.dart';
import 'package:dust_buster/app/modules/notification/views/calendar/calendar_page.dart';
import 'package:dust_buster/app/modules/notification/views/widgets/notification_widget.dart';
import 'package:flutter_svg/svg.dart';
import '../../home/exports.dart';
import 'messager/messager_page.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 15.w),
            Text(
              Strings.notification,
              style: AppTextStyle.titleBodyStyle.copyWith(),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SvgPicture.asset(
              AppImages.iconClean,
              width: 24.w,
              height: 24.h,
              color: AppColors.kGray500Color,
            ),
          ),
          SizedBox(width: 27.w),
        ],
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: Obx(() => TabBar(
                  onTap: (index) {
                    controller.selectTab(index);
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: controller.tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4).r,
                  physics: const NeverScrollableScrollPhysics(),
                  dividerHeight: 0.r,
                  padding: const EdgeInsets.only(top: 16, bottom: 16).r,
                  unselectedLabelColor: AppColors.kGrayTextColor,
                  indicatorSize: TabBarIndicatorSize.values.last,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 6.5).r,
                  indicator: const BoxDecoration(),
                  labelColor: AppColors.white,
                  tabs: [
                    _buildTab(Strings.texting, 0),
                    _buildTab(Strings.calendar, 1),
                    _buildTab(Strings.company, 2),
                    _buildTab(Strings.promotion, 3),
                  ],
                )),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MessagerPage(),
                CalendarPage(),
                NotificationWidget(
                  label: 2,
                  title: 'Thay đổi chính sách',
                  content: 'Thay đổi chính sách sử dụng',
                  image: AppImages.iconCompany,
                  color: AppColors.kBlue500Color,
                  time: '',
                  idIVD: '',
                  id: '',
                ),
                NotificationWidget(
                  label: 3,
                  title: 'Giảm 25% các dịch vụ',
                  content: 'Giảm giá tất cả các dịch vụ từ a sang b',
                  image: AppImages.iconPromotion,
                  color: AppColors.kYellowColor,
                  time: '',
                  idIVD: '',
                  id: '',
                ),
              ],
            ),
          )
        ],
      ),
    );
  } // Hàm tạo tab

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Column(
        children: [
          // ignore: unrelated_type_equality_checks
          if (controller.selectedIndex == index)
            Container(
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(48).r,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize14,
                      fontFamily: "SFProText",
                    ),
                  ),
                ),
              ),
            ),
          // ignore: unrelated_type_equality_checks
          if (controller.selectedIndex != index)
            Container(
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48).r,
                border: Border.all(
                  // ignore: unrelated_type_equality_checks
                  color: controller.selectedIndex != index
                      ? AppColors.kGrayTextColor
                      : Colors.transparent,
                  // ignore: unrelated_type_equality_checks
                  width: controller.selectedIndex != index ? 1.w : 0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize14,
                      fontFamily: "SFProText",
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
