import 'package:chatapp/view/chat_screen/Message_screen.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: deepPurple,
        onPressed: () {},
        child: const Icon(
          Icons.person_add_alt_outlined,
          size: 30,
        ),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Get.to(() => const MessageScreen(),
                    transition: Transition.downToUp);
              },
              title: "Test User".text.size(16).bold.make(),
              subtitle: "Last Message".text.size(13).semiBold.make(),
              trailing: "last seen".text.size(16).bold.make(),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: deepPurple,
                child: Image.asset(
                  person,
                  color: Colors.white,
                ),
              ),
            );
          }),
    ));
  }
}
