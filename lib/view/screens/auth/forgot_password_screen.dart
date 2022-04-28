import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smfp/logic/controller/auth_controller.dart';

import 'package:smfp/view/widgets/auth/auth_text_form_field.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();

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
                          text: "استعادة كلمة المرور",
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
                            child: Image.asset('assets/images/reset.png')),
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
                          prefixIcon: const Icon(Icons.numbers),
                          suffixIcon: const Text(""),
                          hintText: 'رقم الهوية',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(
                          init: AuthController(),
                          builder: (controller) => MainButton(
                            text: 'استعادة كلمة المرور',
                            pressed: () async {
                              controller.authId.value =
                                  idController.text.trim();
                              controller.forgotPassword();
                            },
                          ),
                        )
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
