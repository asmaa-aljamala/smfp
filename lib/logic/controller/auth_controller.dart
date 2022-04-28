import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smfp/main.dart';

import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/screens/auth/reset_password_screen.dart';
import 'package:smfp/view/screens/main/children_screen.dart';

import '../../view/screens/main/chat_screen.dart';

class AuthController extends GetxController {
  String verificationID = "";
  var isVisibilty = true.obs;
  var authId = ''.obs;
  var showSpinner = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var isSignedIn = false;
  final CollectionReference parentRef =
      FirebaseFirestore.instance.collection('Parent');

  void visibility() {
    isVisibilty.value = !isVisibilty.value;

    update();
  }

  void logInUsingFirebase({
    required String id,
    required String password,
  }) async {
    showSpinner.value = true;
    print('^^^^^^^^^6');
    print(showSpinner.value);
    try {
      await auth.signInWithEmailAndPassword(
          email: id + '@gmail.com', password: password);

      authId.value = id;
      sharedPreferences.setString('id', id);
      sharedPreferences.setString('password', password);

      Get.off(
        () => ChildrenScreen(),
      );
      showSpinner.value = false;
      update();
      print('###########');
      print(showSpinner.value);
    } on FirebaseAuthException catch (error) {
      String message = '';

      if (error.code == 'wrong-password') {
        message = 'كلمة المرور غير صحيحة ... حاول مرة أخرى ';
      }
      Get.snackbar(
        'خطأ في تسجيل الدخول',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: theme.mainColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: theme.mainColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> forgotPassword() async {
    try {
      await parentRef.where('id', isEqualTo: authId).get().then(
        (value) {
          auth.verifyPhoneNumber(
            phoneNumber: value.docs[0]['phone'],
            verificationCompleted: (PhoneAuthCredential credential) async {
              await auth.signInWithCredential(credential).then((value) {
                print("You are logged in successfully");
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              print(e.message);
            },
            codeSent: (String verificationId, int? resendToken) {
              verificationID = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
          Get.off(ResetPasswordScreen(
            phone: value.docs[0]['phone'],
          ));
        },
      );
      update();
    } catch (error) {
      String message = 'رقم الهوية غير موجود';
      Get.snackbar(
        'خطأ',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: theme.mainColor,
        colorText: Colors.white,
      );
    }
  }

  void verifyOTP({required String otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);
    try {
      await auth.signInWithCredential(credential).then((value) {
        Get.off(ChildrenScreen());

        Fluttertoast.showToast(
            msg: "تم تسجيل الدخول ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: theme.mainColor,
            textColor: Colors.white,
            fontSize: 16.0);
        // try {
        //   final User? user = auth.currentUser;
        //   print(user!.email);
        //   user.updatePassword(otp);
        //   Fluttertoast.showToast(
        //       msg: "تم تغيير كلمة المرور",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.CENTER,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: theme.mainColor,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // } catch (e) {
        //   print('erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
        // }
      });
      update();
    } catch (error) {
      String message = 'الكود المدخل غير صحيح';
      Get.snackbar(
        'خطأ',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: theme.mainColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> changePhone({
    required String id,
    required String newPhone,
  }) {
    return parentRef
        .doc(id)
        .update({'phone': newPhone})
        .then((_) => Fluttertoast.showToast(
            msg: "تم تغيير رقم الجوال ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: theme.mainColor,
            textColor: Colors.white,
            fontSize: 16.0))
        .catchError((error) {
          Get.snackbar(
            'خطأ',
            '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: theme.mainColor,
            colorText: Colors.white,
          );
        });
  }

  Future<void> changePhoneNum(
      {required String id, required String newPhone}) async {
    try {
      await parentRef.where('id', isEqualTo: authId).get().then(
        (value) {
          auth.verifyPhoneNumber(
            phoneNumber: value.docs[0]['phone'],
            verificationCompleted: (PhoneAuthCredential credential) async {
              await auth.signInWithCredential(credential).then((value) {
                print("You are logged in successfully");
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              print(e.message);
            },
            codeSent: (String verificationId, int? resendToken) {
              verificationID = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
          Get.off(ResetPasswordScreen(
            phone: value.docs[0]['phone'],
          ));
        },
      );
      update();
    } catch (error) {
      String message = 'رقم الهوية غير موجود';
      Get.snackbar(
        'خطأ',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: theme.mainColor,
        colorText: Colors.white,
      );
    }
  }
}
