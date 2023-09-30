import 'package:chatapp/view/splash_screen/onetime_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../consts/firebase_consts.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isuser = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isuser = false;
      } else {
        isuser = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUser();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => isuser ? const Home() : const OnetimeScreen(),
          transition: Transition.rightToLeft);
    });
  }

  late Size mq;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              left: mq.width * .25,
              width: mq.width * .5,
              child: Image.asset(logo)),
          Positioned(
              bottom: mq.height * .15,
              left: mq.width * .25,
              width: mq.width * .5,
              child: "Hello".text.size(20).makeCentered()),
        ],
      ),
    );
  }
}
