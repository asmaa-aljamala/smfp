import 'package:flutter/material.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class HomeworkDetailScreen extends StatelessWidget {
  const HomeworkDetailScreen({Key? key}) : super(key: key);

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
                    text: "تفاصيل الواجب",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "اسم المادة: ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  contentItem(content: 'تاريخ فلسطين'),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "اليوم: ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  contentItem(content: 'الثلاثاء '),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "تاريخ تسليم الواجب : ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  contentItem(content: '22/2/2022 '),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "عنوان الدرس : ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  contentItem(content: 'الحرب العالمية الأولى'),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "تفاصيل الواجب : ",
                    color: Colors.black,
                    underLine: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  contentItem(
                      content: '   حل أسئلة الكتاب صفحة 55 على الدفتر '),
                  const SizedBox(
                    height: 20,
                  ),
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
  required String content,
}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          content,
          style: const TextStyle(
            overflow: TextOverflow.visible,
            color: theme.mainColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
