import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/routes/routes.dart';
import 'package:razan_project/utils/thems/theme.dart';
import 'package:razan_project/view/widget/text_utils.dart';

import 'auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextUtils(
                      text: 'welcome',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        TextUtils(
                          text: 'Arsoo',
                          color: mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextUtils(
                          text: 'Shop',
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12)),
                      onPressed: () {
//Get.toNamed(Routes.loginScreen);
//Get.toNamed(Routes.signUpScreen);
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: TextUtils(
                        text: "Get Start",
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Dont Have an Acount?",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child: TextUtils(
                            text: "Sign Up",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            underLine: TextDecoration.underline,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
