import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/util/exports.dart';
import '../../../../data/models/phong_chat_models/phong_chat_model.dart';
import '../../../chat/view/chat_view.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_empty_widget.dart';
import '../../../widgets/custom_not_found_widget.dart';
import '../../controllers/messager_controller.dart';
import 'loading/messager_loading.dart';
import 'messager_widget.dart';

class MessagerPage extends StatefulWidget {
  const MessagerPage({Key? key}) : super(key: key);

  @override
  _MessagerPageState createState() => _MessagerPageState();
}

class _MessagerPageState extends State<MessagerPage> {
  final MessagerController controller = Get.put(MessagerController());
  @override
  void initState() {
    controller.getPhongChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => controller.getPhongChat(),
        child: controller.obx(
          (state) {
            return ListView.separated(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: state?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final PhongChat? model = state![index] as PhongChat?;

                return MessagerWidget(model: model!);
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: 0.0, height: 8.h),
            );
          },
          onLoading: const MessagerLoading(),
          onEmpty: Center(child: CustomEmptyWidget(top: 0.12.sh)),
          onError: (error) =>
              Center(child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
        ),
      ),
    );
  }
}
