import 'package:chatapp/view/camera_screen/camera_screen.dart';
import 'package:chatapp/view/status_screen/status_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../consts/firebase_consts.dart';
import '../../controller/home_controller.dart';
import '../../service/store_service.dart';
import '../chat_screen/chat_screen.dart';
import 'component/drawer_widget.dart';
import 'component/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller;

  loading() {
    controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      loading();
    });

    var navbarItem = [
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            chats,
            width: 32,
            color: deepPurple,
          ),
          icon: Image.asset(chats, width: 26),
          label: "Chats"),
      BottomNavigationBarItem(
          activeIcon: Image.asset(status, width: 32),
          icon: Image.asset(status, width: 26),
          label: "Status"),
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            camera,
            width: 32,
            color: deepPurple,
          ),
          icon: Image.asset(camera, width: 26),
          label: "Camera"),
    ];
    var navBody = [
      const ChatScreen(),
      const StatusScreen(),
      const CameraScreen(),
    ];
    final scafoldkey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scafoldkey,
        drawer: FutureBuilder(
            future: StoreService.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                return drawer(data: data);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        body: FutureBuilder(
            future: StoreService.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                return Column(
                  children: [
                    appbar(scafoldkey, data: data),
                    Obx(() => Expanded(
                        child: navBody
                            .elementAt(controller.currentNavIndex.value)))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: deepPurple,
            selectedLabelStyle: const TextStyle(fontFamily: bold),
            backgroundColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
