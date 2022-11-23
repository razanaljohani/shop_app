import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/view/screens/auth/forget_password.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/thems/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_form.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth/container_under.dart';
import '../../widget/text_utils.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              elevation: 0,
            ),
            backgroundColor: context.theme.backgroundColor,
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
                                    text: "LOG",
                                    color: Get.isDarkMode ? mainColor : pinkClr,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    underLine: TextDecoration.none),
                                SizedBox(
                                  width: 3,
                                ),
                                TextUtils(
                                    text: "IN",
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
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.forgetpasswordscreen);
                                  },
                                  child: TextUtils(
                                      fontSize: 14,
                                      text: "forget password?",
                                      color: Get.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.normal,
                                      underLine: TextDecoration.none)),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return AuthButton(
                                text: 'LOG IN',
                                onPressed: () {
                                  if (fromKey.currentState!.validate()) {
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.logInUsingFirebase(
                                        email: email, password: password);
                                  }
                                },
                              );
                            }),
                            SizedBox(
                              height: 20,
                            ),
                            TextUtils(
                                fontSize: 14,
                                text: "OR",
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.normal,
                                underLine: TextDecoration.none),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder<AuthController>(builder: (_) {
                                  return InkWell(
                                      onTap: () {
                                        controller.googleSinUpApp();
                                      },
                                      child: Image.asset(
                                          "assets/images/google.png"));
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/images/facebook.png"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ContainerUnder(
                    text: "Don't have an account?",
                    textType: "Sign up",
                    onpressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                  ),
                ],
              ),
            )));
  }
}
