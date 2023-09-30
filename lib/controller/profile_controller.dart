import 'dart:io';
import 'package:chatapp/consts/consts.dart';
import 'package:chatapp/consts/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  var namecontroller = TextEditingController();
  var aboutcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var profileImgLink = '';
  var profileImagePath = ''.obs;

  changeImage(context, source) async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
    var status = await Permission.photos.status;
    if (status.isGranted) {
      try {
        final img =
            await ImagePicker().pickImage(source: source, imageQuality: 80);
        if (img == null) return;
        profileImagePath.value = img.path;
      } on PlatformException catch (e) {
        VxToast.show(context, msg: e.toString());
      }
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImgLink = await ref.getDownloadURL();
  }

  updateProfile(context) async {
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);
    await store.set({
      'name': namecontroller.text.toString(),
      'about': aboutcontroller.text.toString(),
      'image_url': profileImgLink
    }, SetOptions(merge: true));
    VxToast.show(context,
        msg: "Profile update successfully",
        bgColor: Colors.white,
        textColor: Colors.black);
  }
}
