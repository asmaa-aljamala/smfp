import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smfp/logic/controller/auth_controller.dart';
import 'package:smfp/routes/routes.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/text_utils.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/auth/auth_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const TextUtils(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          text: "انشاء حساب",
                          color: Colors.black,
                          underLine: TextDecoration.none,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/login.png')),
                        const SizedBox(
                          height: 30,
                        ),
                        AuthTextFromField(
                          controller: idController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'رقم الهوية يجب ان يكون من 8 أرقام';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.perm_identity,
                            color: theme.mainColor,
                          ),
                          suffixIcon: const Text(''),
                          hintText: 'رقم الهوية',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthTextFromField(
                          controller: passwordController,
                          obscureText: controller.isVisibilty.value,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'كلمة المرور يجب ان تكون من 6 أرقام';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: theme.mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibility();
                            },
                            icon: controller.isVisibilty.value
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                          ),
                          hintText: 'كلمة المرور',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.forgotPasswordScreen),
                          child: const TextUtils(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            text: "نسيت كلمة المرور",
                            color: theme.secondaryColor,
                            underLine: TextDecoration.none,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MainButton(
                            text: 'تسجيل الدخول',
                            pressed: () async {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: "barry.allen@example.com",
                                            password: "SuperSecretPassword!");
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
