import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smfp/logic/controller/auth_controller.dart';
import 'package:smfp/routes/routes.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/screens/main/children_screen.dart';
import 'package:smfp/view/widgets/auth/auth_text_form_field.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/text_utils.dart';

var isLoading = false;

class ResetPasswordScreen extends StatelessWidget {
  final String phone;
  ResetPasswordScreen({required this.phone, Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

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
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/reset.png')),
                        const SizedBox(
                          height: 30,
                        ),
                        TextUtils(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          text: " تم ارسال الكود الى الرقم الخاص بك " +
                              phone.replaceRange(3, 8, '*****'),
                          color: theme.mainColor,
                          underLine: TextDecoration.none,
                          textAlign: TextAlign.right,
                        ),
                        AuthTextFromField(
                          controller: otpController,
                          obscureText: false,
                          validator: (value) {},
                          prefixIcon: const Icon(Icons.numbers),
                          suffixIcon: const Text(""),
                          hintText: 'ادخل الكود',
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
                              text: 'تسجيل الدخول',
                              pressed: () async {
                                controller.verifyOTP(
                                    otp: otpController.text.trim());
                              }),
                        ),
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
