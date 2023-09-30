import 'package:chatapp/consts/consts.dart';
import 'package:chatapp/consts/firebase_consts.dart';
import 'package:chatapp/service/store_service.dart';
import 'package:chatapp/view/profile_screen/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Widget appbar(GlobalKey<ScaffoldState> key,{var data}) {
  return Container(
    padding: const EdgeInsets.only(right: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: const BoxDecoration(
                color: deepPurple,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            height: 70,
            width: 80,
            child: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        "Chat Me".text.color(Colors.black).size(24).bold.make(),
        CircleAvatar(
                backgroundColor: deepPurple,
                radius: 27,
                child: data['image_url'] != ''
                    ? Image.network(
                        data['image_url'],
                        width: 120,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.asset(
                        person,
                        color: Colors.white,
                        width: 47,
                      ))
            .onTap(() {
          Get.to(() => const ProfileScreen(),
              transition: Transition.rightToLeft);
        })
      ],
    ),
  );
}
