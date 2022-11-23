import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/logic/controllers/auth_controller.dart';
import 'package:razan_project/routes/routes.dart';
import 'package:razan_project/utils/my_string.dart';
import 'package:razan_project/utils/thems/theme.dart';
import 'package:razan_project/view/widget/text_utils.dart';

import '../../widget/auth/auth_text_form.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                      child: Form(
                        key: fromKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextUtils(
                                    text: "Sign",
                                    color: Get.isDarkMode ? mainColor : pinkClr,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    underLine: TextDecoration.none),
                                SizedBox(
                                  width: 3,
                                ),
                                TextUtils(
                                    text: "Up",
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    underLine: TextDecoration.none)
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            AuthTextField(
                              controller: nameController,
                              obscureText: false,
                              validator: (value) {
                                if (value.toString().length <= 2 ||
                                    !RegExp(validationName).hasMatch(value)) {
                                  return 'Enter valid name';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset("assets/images/user.png")
                                  : Icon(
                                      Icons.person,
                                      color: pinkClr,
                                    ),
                              suffixIcon: Text(""),
                              hintText: "User Name",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if (RegExp(validationEmail).hasMatch(value)) {
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
                              height: 20,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return AuthTextField(
                                controller: passwordController,
                                obscureText:
                                    controller.isVisibilty ? false : true,
                                validator: (value) {
                                  if (value.toString().length <= 6) {
                                    return 'password shoud be equal to 6 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                prefixIcon: Get.isDarkMode
                                    ? Image.asset("assets/images/lock.png")
                                    : Icon(
                                        Icons.lock,
                                        color: pinkClr,
                                      ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.isVisibilty;
                                    },
                                    icon: controller.isVisibilty
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )),
                                hintText: "Password",
                              );
                            }),
                            SizedBox(
                              height: 50,
                            ),
                            CheckWidget(),
                            SizedBox(
                              height: 50,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return AuthButton(
                                text: 'SIGN UP',
                                onPressed: () {
                                  if (controller.isCheckBox == false) {
                                    Get.snackbar("check box",
                                        "please Accept terms & conditiiions",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white);
                                  } else if (fromKey.currentState!.validate()) {
                                    String name = nameController.text.trim();
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.signUpUsingFirebase(
                                        email: email,
                                        name: name,
                                        password: password);
                                    controller.isCheckBox = true;
                                  }
                                },
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                  ContainerUnder(
                    text: "Already have an account?",
                    textType: "Log in",
                    onpressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                  ),
                ],
              ),
            )));
  }
}
