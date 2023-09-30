import 'package:chatapp/consts/consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget imagePicker(context, controller) {
  var listTile = ["camera", "gallery"];
  var icon = [Icons.camera_alt_rounded, Icons.image_rounded];
  return Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "Select one".text.white.semiBold.make(),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
                listTile.length,
                (index) => ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.back();
                            controller.changeImage(context, ImageSource.camera);
                            break;
                          case 1:
                            Get.back();
                            controller.changeImage(context, ImageSource.gallery);
                            break;
                        }
                      },
                      leading: Icon(
                        icon[index],
                        color: Colors.white,
                      ),
                      title: listTile[index].text.white.make(),
                    )),
          )
        ],
      ),
    ),
  );
}
