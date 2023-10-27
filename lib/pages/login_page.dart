import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:writopia_frontend/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginPageController = Get.put(LoginController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/bg.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(12)),
                      child: Image.asset(
                        "assets/images/hero.jpg",
                        width: 450,
                        height: 491,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      constraints: const BoxConstraints(
                        maxWidth: 450,
                        // minHeight: 500,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: Image.asset(
                              "assets/images/logo.jpg",
                              // width: ,
                              height: 150,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: DefaultTextStyle(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "Welcome to Writopia",
                                    textAlign: TextAlign.center,
                                  ),
                                  TypewriterAnimatedText(
                                    "Sign in to writopia",
                                    textAlign: TextAlign.center,
                                  ),
                                  TypewriterAnimatedText(
                                    "Get the work done!",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                                // isRepeatingAnimation: true,
                                repeatForever: true,
                              ),
                            ),
                          ),

                          // Username
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.25),
                            padding: const EdgeInsets.all(12),
                            child: TextField(
                              controller:
                                  loginPageController.usernameController.value,
                              decoration: const InputDecoration(
                                hintText: "username",
                                labelText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),

                          // Username
                          Obx(
                            () => Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.25),
                              padding: const EdgeInsets.all(12),
                              child: TextField(
                                obscureText:
                                    loginPageController.showPassword.value,
                                controller: loginPageController
                                    .passWordController.value,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        loginPageController.showPassword.value =
                                            !loginPageController
                                                .showPassword.value;
                                      },
                                      icon: Icon(CupertinoIcons.eye)),
                                  hintText: "Your secure password",
                                  labelText: "Password",
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Obx(
                              () => loginPageController.isLoading.value
                                  ? SizedBox(
                                      width: 200,
                                      child: LoadingAnimationWidget.fallingDot(
                                        color: Colors.blue,
                                        size: 50,
                                      ))
                                  : ElevatedButton(
                                      onPressed: () {
                                        loginPageController.isLoading.value =
                                            true;
                                        // loginPageController.login();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.only(
                                            top: 25, bottom: 25),
                                      ),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          ),

                          // Register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, right: 3),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: const Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      debugPrint("Here");
                                      // loginPageController.forgotPassword();
                                    },
                                  ),
                                ),
                              ),

                              Text("|"),

                              // Register
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 3, top: 12, bottom: 12, right: 16),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: const Text(
                                      "Register for account?",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      debugPrint("Here");
                                      Get.toNamed('/register');
                                      // loginPageController.toSignUpPage();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
