import 'package:chatapp/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../consts/firebase_consts.dart';
import '../view/home/home.dart';

class AuthController extends GetxController {
  var getusername = TextEditingController();
  var getphone = TextEditingController();
  var getotp = List.generate(6, (index) => TextEditingController());
//  var getcountrycode = TextEditingController();
  var isOtpSend = false.obs;
  var formkey=GlobalKey<FormState>();

  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = "";

  sendOtp(context) async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };
    phoneVerificationFailed = (FirebaseAuthException e) async {
      if (e.code == "invalid-phone-number") {
        VxToast.show(context, msg: "Invalid phone number");
      }
      VxToast.show(context, msg: "Error network");
    };
    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+880${getphone.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  verifyOtp(context) async {
    String otp = "";
    if (getotp.length.isLowerThan(6)) {
      VxToast.show(context,
          msg: "wrong otp",
          bgColor: Colors.black,
          textColor: Colors.white);
    } else {
      for (var i = 0; i < getotp.length; i++) {
        otp += getotp[i].text;
      }
      try {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: otp);
        final User? user =
            (await auth.signInWithCredential(phoneAuthCredential)).user;
        if (user != null) {
          DocumentReference store = FirebaseFirestore.instance
              .collection(collectionUser)
              .doc(user.uid);
          await store.set({
            'id': user.uid,
            'name': getusername.text.toString(),
            'phone':"+880${getphone.text}".toString(),
            'about':'',
            'image_url':''
          });
          VxToast.show(context,
              msg: "Successfully create an account",
              bgColor: Colors.black,
              textColor: Colors.white);
          Get.offAll(() => const Home(),
              transition: Transition.rightToLeft);
        }
      } catch (e) {
        VxToast.show(context,
            msg: e.toString(),
            bgColor: Colors.black,
            textColor: Colors.white);
      }
    }
  }
}
