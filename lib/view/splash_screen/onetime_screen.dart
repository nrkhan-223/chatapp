import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../consts/strings.dart';
import '../authscreen/verify_screen.dart';

class OnetimeScreen extends StatelessWidget {
  const OnetimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        icbot,
                        width: 120,
                      ),
                      10.heightBox,
                      appname.text.size(28).semiBold.make(),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        children: List.generate(listOfFeatures.length, (index) {
                          return Chip(
                              labelPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3),
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(color: Colors.black38),
                              label: listOfFeatures[index]
                                  .text
                                  .semiBold
                                  .size(16)
                                  .make());
                        }),
                      ),
                      30.heightBox,
                      slogan.text.size(35).letterSpacing(1.5).bold.make(),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: context.screenWidth - 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const VerifyScreen(),
                                  transition: Transition.rightToLeft);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(15),
                              shape: const StadiumBorder(),
                            ),
                            child: cont.text.semiBold.size(16).make()),
                      ),
                      const Spacer(),
                      poweredby.text.semiBold.size(16).make(),
                      10.heightBox
                    ],
                  ))
            ],
          ),
        ),

    );
  }
}
