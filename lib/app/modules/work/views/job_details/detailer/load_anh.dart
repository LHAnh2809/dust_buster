import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../common/util/exports.dart';
import '../../../../home/views/home_view.dart';

class LoadAnh extends StatelessWidget {
  final List<String> imageList;
  final int selectedImageIndex;

  const LoadAnh(
      {Key? key, required this.imageList, required this.selectedImageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: 'Ảnh chi tiết',
      ),
      body: PageView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          String? apiUrl = Storage.getValue<String>('apiUrl');
          return PhotoView(
            imageProvider: NetworkImage(
              "$apiUrl/get-image/?image_path=${imageList[index]}",
            ),
            initialScale: index == selectedImageIndex
                ? PhotoViewComputedScale.contained * 0.8
                : PhotoViewComputedScale.contained * 0.8,
          );
        },
        controller: PageController(initialPage: selectedImageIndex),
      ),
    );
  }
}
