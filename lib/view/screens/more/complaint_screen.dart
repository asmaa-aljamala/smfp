import 'package:flutter/material.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: double.infinity,
                    height: 60,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: "تقديم شكوى ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  contentItem(hintText: 'أدخل موضوع الشكوى', line: 3),
                  const SizedBox(
                    height: 20,
                  ),
                  contentItem(hintText: 'أدخل محتوى الشكوى', line: 12),
                  const SizedBox(
                    height: 30,
                  ),
                  MainButton(text: 'تقديم الشكوى ', pressed: () {})
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

Widget contentItem({
  required String hintText,
  required int line,
}) {
  return Material(
    borderRadius: BorderRadius.circular(30),
    elevation: 5,
    shadowColor: Colors.grey,
    child: TextFormField(
      maxLines: line,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: theme.mainColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
