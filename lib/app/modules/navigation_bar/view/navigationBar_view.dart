import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/navigation_bar/view/widgets/bottomNavigationBarItem_widget.dart';
import 'package:flutter/services.dart';

import '../exports.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );

    return Scaffold(
      body: Obx(
        () => controller.srceens[controller.selecteIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => Stack(
          children: [
            Container(
              height: 56.0.h,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.white,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed,
                unselectedFontSize: 12.sp,
                selectedFontSize: 12.sp,
                // iconSize: 20.sp,
                items: <BottomNavigationBarItem>[
                  _buildBottomNavigationBarItem(
                    AppImages.homePage,
                    Strings.homePage,
                    controller.selecteIndex.value == 0
                        ? [
                            AppColors.kBrightPurpleColor,
                            AppColors.kDarkPurpleColor
                          ]
                        : [
                            AppColors.kGrayTextFormColor,
                            AppColors.kGrayTextFormColor
                          ],
                  ),
                  _buildBottomNavigationBarItem(
                    AppImages.iconWork,
                    Strings.work,
                    controller.selecteIndex.value == 1
                        ? [
                            AppColors.kBrightPurpleColor,
                            AppColors.kDarkPurpleColor
                          ]
                        : [
                            AppColors.kGrayTextFormColor,
                            AppColors.kGrayTextFormColor
                          ],
                  ),
                  _buildBottomNavigationBarItem(
                    AppImages.iconNotification,
                    Strings.notification,
                    controller.selecteIndex.value == 2
                        ? [
                            AppColors.kBrightPurpleColor,
                            AppColors.kDarkPurpleColor
                          ]
                        : [
                            AppColors.kGrayTextFormColor,
                            AppColors.kGrayTextFormColor
                          ],
                  ),
                  _buildBottomNavigationBarItem(
                    AppImages.iconAccount,
                    Strings.account,
                    controller.selecteIndex.value == 3
                        ? [
                            AppColors.kBrightPurpleColor,
                            AppColors.kDarkPurpleColor
                          ]
                        : [
                            AppColors.kGrayTextFormColor,
                            AppColors.kGrayTextFormColor
                          ],
                  ),
                ],
                selectedItemColor: AppColors.black,
                unselectedItemColor: AppColors.kGrayTextFormColor,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600),
                currentIndex: controller.selecteIndex.value,
                onTap: (int index) {
                  controller.selecteIndex.value = index;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String imagePath,
    String label,
    List<Color> colors,
  ) {
    return BottomNavigationBarItem(
      icon: BottomNavigationBarItemWidget(imagePath: imagePath, colors: colors),
      label: label,
    );
  }
}
