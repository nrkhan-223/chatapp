import 'package:chatapp/controller/auth_controller.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: "Lets Connect".text.color(Colors.black).bold.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        letterSpacing: 0.9,
                      ),
                      controller: controller.getusername,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide:
                                  const BorderSide(color: Colors.black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: deepPurple)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: deepPurple,
                          ),
                          labelText: "User Name",
                          labelStyle: const TextStyle(
                              letterSpacing: 0.4,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold)),
                    ),
                    10.heightBox,
                    TextFormField(
                      style: const TextStyle(
                        letterSpacing: 0.9,
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.getphone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide:
                                  const BorderSide(color: Colors.black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: deepPurple)),
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: deepPurple,
                          ),
                          prefixText: "+880",
                          labelText: "Phone number",
                          labelStyle: const TextStyle(
                              letterSpacing: 0.4,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
            6.heightBox,
            "We will send an SMS with a conformation code to your phone number."
                .text.size(14)
                .semiBold.fontFamily(semibold)
                .make(),
            20.heightBox,
            Obx(
              () => Visibility(
                visible: controller.isOtpSend.value,
                child: SizedBox(
                  height: 70,
                  child: Row(
                      children: List.generate(
                          6,
                          (index) => SizedBox(
                                width: 56,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: controller.getotp[index],
                                    cursorColor: deepPurple,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.length == 1 && index <= 5) {
                                        FocusScope.of(context).nextFocus();
                                      } else if (value.isEmpty && index > 0) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    style: const TextStyle(
                                      fontFamily: semibold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 1.5,
                                              color: deepPurple,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintText: "*",
                                        hintStyle: const TextStyle(
                                            color: gray,
                                            fontSize: 25,
                                            fontFamily: semibold)),
                                  ),
                                ),
                              ))),
                ),
              ),
            ),
            const Spacer(),
            Align(
                child: SizedBox(
                    width: context.screenWidth - 80,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (controller.formkey.currentState!.validate()) {
                            if (controller.isOtpSend.value == false) {
                              controller.isOtpSend.value = true;
                              await controller.sendOtp(context);
                            } else {
                              await controller.verifyOtp(context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.all(15),
                          shape: const StadiumBorder(),
                        ),
                        child: "Continue".text.semiBold.size(16).make()))),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
