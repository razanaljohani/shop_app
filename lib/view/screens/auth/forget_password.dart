import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/logic/controllers/auth_controller.dart';
import 'package:razan_project/utils/thems/theme.dart';
import 'package:razan_project/view/widget/auth/auth_button.dart';

import '../../../utils/my_string.dart';
import '../../widget/auth/auth_text_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            title: Text(
              "Forget Password",
              style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                )),
          ),
          body: Form(
              key: fromKey,
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "If you want to recover your account, then please provide your email ID below...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.black : Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/forgetpass copy.png",
                        width: 350,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AuthTextField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset("assets/images/email.png")
                            : Icon(
                                Icons.email,
                                color: pinkClr,
                              ),
                        suffixIcon: Text(""),
                        hintText: "Eamil",
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                            text: "SEND",
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                controller
                                    .resetPassword(emailController.text.trim());
                              }
                            });
                      })
                    ])),
              ))),
    );
  }
}
