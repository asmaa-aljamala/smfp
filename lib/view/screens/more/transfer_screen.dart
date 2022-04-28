import 'package:flutter/material.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class TransferStudentScreen extends StatelessWidget {
  const TransferStudentScreen({Key? key}) : super(key: key);

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
                    text: "نقل طالب من المدرسة",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  contentItem(hintText: 'اسم الطالب بالكامل'),
                  const SizedBox(
                    height: 20,
                  ),
                  contentItem(
                    hintText: 'معدل الطالب السنة الماضية',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  contentItem(
                    hintText: 'المرحلة الدراسية',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  contentItem(
                    hintText: 'دواعي النقل',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  contentItem(
                    hintText: 'المدرسة الحالية',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  contentItem(
                    hintText: 'المدرسة المراد النفل اليها',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MainButton(text: 'تقديم الطلب', pressed: () {})
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
}) {
  return Material(
    borderRadius: BorderRadius.circular(30),
    elevation: 5,
    shadowColor: Colors.grey,
    child: TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
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
