import 'package:chatapp/consts/consts.dart';
import 'package:chatapp/consts/strings.dart';
import 'package:chatapp/view/authscreen/verify_screen.dart';
import 'package:chatapp/view/profile_screen/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../consts/firebase_consts.dart';
import '../../../service/store_service.dart';

Widget drawer({var data}) {
  return Drawer(
    backgroundColor: grayblack,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            title: "Setting".text.semiBold.white.make(),
          ),
          20.heightBox,
          Column(
            children: [
              CircleAvatar(
                  backgroundColor: deepPurple,
                  radius: 45,
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
                        )),
              10.heightBox,
              "${data['name']}".text.bold.white.size(18).makeCentered(),
            ],
          ),
          20.heightBox,
          const Divider(
            color: graywhite,
            height: 1,
            thickness: 1,
          ),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
                drawericon.length,
                (index) => ListTile(
                      leading: Icon(
                        drawericon[index],
                        color: Colors.white,
                      ),
                      title: drawerlisttext[index]
                          .text
                          .semiBold
                          .white
                          .size(15)
                          .make(),
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const ProfileScreen(),
                                transition: Transition.downToUp);
                            break;
                          case 1:
                          case 2:
                          case 3:
                          case 4:
                        }
                      },
                    )),
          ),
          10.heightBox,
          const Divider(
            color: graywhite,
            height: 1,
            thickness: 1,
          ),
          15.heightBox,
          ListTile(
            leading: const Icon(
              Icons.emoji_people_rounded,
              color: Colors.white,
            ),
            title: "Invite a friend".text.semiBold.white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await auth.signOut();
              Get.offAll(() => const VerifyScreen(),
                  transition: Transition.leftToRight);
            },
            leading: const Icon(
              iclogout,
              color: Colors.white,
            ),
            title: "LogOut".text.semiBold.white.make(),
          )
        ],
      ),
    ),
  );
}
