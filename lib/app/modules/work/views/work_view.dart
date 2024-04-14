import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dust_buster/app/common/util/notification_sevice.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import '../exports.dart';
import 'widgets/history_page.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaitingController waitingController = Get.put(WaitingController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              Strings.work,
              style: AppTextStyle.largeBodyStyle.copyWith(
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () async {
              waitingController
                  .getHistoryy()
                  .then((value) => Get.to(() => const HistoryPage()));
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12).r,
              width: 96.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.kWarning100Color,
                borderRadius: BorderRadius.circular(16).r,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    child: SvgPicture.asset(
                      AppImages.iconAccessTime,
                      color: AppColors.kWarning700Color,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  SizedBox(width: 6.w, height: 0.0),
                  Text(
                    Strings.history,
                    style: AppTextStyle.largeBodyStyle.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kWarning700Color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Obx(() => TabBar(
                onTap: (index) {
                  controller.selectTab(index);
                },
                controller: controller.tabController,
                labelPadding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                dividerHeight: 0,
                padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 16)
                    .r,
                unselectedLabelColor: AppColors.kGrayTextColor,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(),
                labelColor: AppColors.white,
                tabs: [
                  _buildTab("Chờ làm", 0),
                  _buildTab("Lặp lại", 1),
                  _buildTab("Theo gói", 2),
                ],
              )),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                WaitingPage(),
                RepeatPage(),
                ByPackagePage(),
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
              width: 109.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(48).r,
              ),
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
          // ignore: unrelated_type_equality_checks
          if (controller.selectedIndex != index)
            Container(
              width: 109.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48).r,
                border: Border.all(
                  // ignore: unrelated_type_equality_checks
                  color: controller.selectedIndex != index
                      ? AppColors.kGrayTextColor
                      : Colors.transparent,
                  width:
                      // ignore: unrelated_type_equality_checks
                      controller.selectedIndex != index ? 1.w : 0,
                ),
              ),
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
        ],
      ),
    );
  }
}
