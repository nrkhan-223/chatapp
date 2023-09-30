import 'package:chatapp/consts/firebase_consts.dart';
import 'package:chatapp/consts/strings.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/service/store_service.dart';
import 'package:chatapp/view/home/home.dart';
import 'package:chatapp/view/profile_screen/component/imagepicker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    var img;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ).onTap(() {
           // Get.back();
            Get.offAll(const Home(), transition: Transition.leftToRight);
          }),
          backgroundColor: Colors.transparent,
          title: "Profile".text.color(Colors.white).size(24).bold.make(),
          actions: [
            TextButton(
                onPressed: () async {
                  if (controller.profileImagePath.value.isNotEmpty) {
                    await controller.uploadProfileImage();
                  } else {
                    controller.profileImgLink = img;
                  }
                  //await controller.uploadProfileImage();
                  await controller.updateProfile(context);
                },
                child: "Save".text.semiBold.white.size(17).make())
          ],
        ),
        body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FutureBuilder(
                  future: StoreService.getUser(currentUser!.uid),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!.docs[0];
                      img=data['image_url'];
                      controller.namecontroller.text = data['name'];
                      controller.phonecontroller.text = data['phone'];
                      controller.aboutcontroller.text = data['about'];
                      return Column(children: [
                        Obx(
                          () => Stack(
                            children: [
                              data['image_url'] == '' &&
                                      controller.profileImagePath.isEmpty
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundColor: deepPurple,
                                      child: Image.asset(
                                        person,
                                        color: Colors.white,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make())
                                  : data['image_url'] != '' &&
                                          controller.profileImagePath.isEmpty
                                      ? Image.network(
                                          data['image_url'],
                                          width: 120,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make()
                                      : Image.file(
                                          File(controller
                                              .profileImagePath.value),
                                          width: 120,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make(),
                              Positioned(
                                  right: 0,
                                  bottom: 25,
                                  child: CircleAvatar(
                                    backgroundColor: deepPurple,
                                    radius: 15,
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 20,
                                    ).onTap(() {
                                      Get.dialog(
                                          imagePicker(context, controller));
                                    }),
                                  ))
                            ],
                          ),
                        ),
                        10.heightBox,
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                              controller: controller.namecontroller,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                label: "Name".text.make(),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              )),
                          subtitle: nameworning.text.semiBold.gray400.make(),
                        ),
                        ListTile(
                            leading: Image.asset(
                              myself,
                              color: Colors.white,
                              width: 20,
                            ),
                            title: TextFormField(
                                maxLines: 3,
                                controller: controller.aboutcontroller,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: "About".text.make(),
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ))),
                        10.heightBox,
                        ListTile(
                            leading: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            title: TextFormField(
                                readOnly: true,
                                controller: controller.phonecontroller,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  label: "Phone".text.make(),
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                ))),
                      ]);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    }
                  }),
            )));
  }
}
