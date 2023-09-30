import 'package:get/get.dart';
import '../../consts/consts.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        leadingWidth: 190,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_outlined,
                color: Colors.deepPurple,
              ).onTap(() {
                Get.back();
              }),
              12.widthBox,
              CircleAvatar(
                  radius: 20,
                  backgroundColor: deepPurple,
                  child: Image.asset(
                    person,
                    color: Colors.white,
                  )),
              5.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "username".text.bold.size(17).white.makeCentered(),
                  5.heightBox,
                  "Last seen 18:18"
                      .text
                      .semiBold
                      .size(13)
                      .color(graywhite)
                      .make()
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: deepPurple,
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                10.widthBox,
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: deepPurple,
                  child: Icon(
                    Icons.video_call_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                10.widthBox,
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: deepPurple,
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                5.widthBox
              ],
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(6))),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 200,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: deepPurple,
                            child: Image.asset(
                              person,
                              color: Colors.white,
                            ),
                          ),
                          22.widthBox,
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "hello".text.white.size(16).make(),
                                    4.heightBox,
                                    10.heightBox,
                                    "time"
                                        .text
                                        .color(Colors.white.withOpacity(0.5))
                                        .size(12)
                                        .make()
                                  ],
                                )),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  }),
            ),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 51,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: semibold,
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.emoji_emotions_outlined,color: gray),
                            suffixIcon: Icon(Icons.attachment_rounded,color: gray,),
                            border: InputBorder.none,
                            hintText: "Type message here",
                            hintStyle: TextStyle(
                                fontFamily: semibold,
                                fontSize: 14,
                                color: gray)),
                      ),
                    )),
                    10.widthBox,
                    const Icon(
                      Icons.send_sharp,
                      color: deepPurple,
                    )
                  ],
                ),
              ),
            ),
            3.heightBox
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //         child: TextFormField(
            //           decoration: const InputDecoration(
            //             hintText: "Type  massage ...",
            //             border: OutlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //           ),
            //         )),
            //     IconButton(
            //         onPressed: () {
            //
            //         },
            //         icon: const Icon(
            //           Icons.send,
            //           color: deepPurple,
            //         ))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
