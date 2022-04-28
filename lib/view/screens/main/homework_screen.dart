import 'package:flutter/material.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                        text: "الواجبات",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildHomeworkItems(
                            day: 'الثلاثاء',
                            date: '22/2/2022',
                            course: 'رياضيات',
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHomeworkItems({
  required String day,
  required String date,
  required String course,
}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اليوم: ' + day,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'التاريخ: ' + date,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'تم اضافة واجب جديد لمادة ' + course,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' اضغط هنا',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: theme.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
