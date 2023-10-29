import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:wakforce/constants/constants.dart';
import 'package:writopia_frontend/controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpPageController signUpController = Get.put(SignUpPageController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                    // minHeight: 500,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
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
                                "Working with Writopia is easy",
                                textAlign: TextAlign.center,
                              ),
                              TypewriterAnimatedText(
                                "Finish Assignments in time",
                                textAlign: TextAlign.center,
                              ),
                              TypewriterAnimatedText(
                                "Work with professionals",
                                textAlign: TextAlign.center,
                              ),
                              TypewriterAnimatedText(
                                "Get exceptional grades!",
                                textAlign: TextAlign.center,
                              )
                            ],
                            // isRepeatingAnimation: true,
                            repeatForever: true,
                          ),
                        ),
                      ),

                      // Name inputs
                      Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 220,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: TextField(
                                controller:
                                    signUpController.firstNameController.value,
                                decoration: const InputDecoration(
                                  hintText: "Patrick",
                                  labelText: "First Name",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),

                            // Last name
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 220,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: TextField(
                                controller:
                                    signUpController.lastNameController.value,
                                decoration: const InputDecoration(
                                  hintText: "Star",
                                  labelText: "Last Name",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.25),
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: signUpController.emailController.value,
                          decoration: const InputDecoration(
                            hintText: "kelvin@example.com",
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.25),
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: signUpController.phoneController.value,
                          decoration: const InputDecoration(
                            hintText: "+2540898282382",
                            labelText: "Phone",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.25),
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: signUpController.countryController.value,
                          decoration: const InputDecoration(
                            hintText: "Kenya",
                            labelText: "Country",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),

                      //password
                      Obx(
                        () => Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.25),
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            obscureText: signUpController.hidePassword.value,
                            controller:
                                signUpController.passwordController.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signUpController.hidePassword.value =
                                      !signUpController.hidePassword.value;
                                },
                                icon: const Icon(
                                  CupertinoIcons.eye,
                                ),
                              ),
                              hintText: "Your new password",
                              labelText: "Password",
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.25),
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            obscureText:
                                signUpController.hideConfirmPassword.value,
                            controller: signUpController
                                .confirmPasswordController.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signUpController.hideConfirmPassword.value =
                                      !signUpController
                                          .hideConfirmPassword.value;
                                },
                                icon: const Icon(
                                  CupertinoIcons.eye,
                                ),
                              ),
                              hintText: "Confirm your password",
                              labelText: "Confirm Password",
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
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: const Text(
                              "Already have account?",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              // currentUser = null;
                              Get.toNamed('/login');
                            },
                          ),
                        ),
                      ),

                      Obx(
                        () => Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Checkbox(
                                value: signUpController.termsAccepted.value,
                                onChanged: (value) {
                                  signUpController.termsAccepted.value = value!;
                                },
                              ),
                              const Text(
                                "I agree to the terms and conditions outlined by Writopia",
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () async {
                            await signUpController.signUp();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
