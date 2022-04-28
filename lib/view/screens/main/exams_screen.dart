import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smfp/logic/controller/exam_controller.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({Key? key}) : super(key: key);
  ExamController controller = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                      text: "جدول الاختبارات",
                      color: Colors.black,
                      underLine: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GetX<ExamController>(
                      builder: (controller) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(
                              theme.mainColor.withOpacity(0.3)),
                          headingTextStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theme.secondaryColor),
                          dataTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: theme.mainColor),
                          columns: const [
                            DataColumn(
                              label: Text(
                                'المادة',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'التاريخ',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'الساعة',
                              ),
                            ),
                          ],
                          rows: [
                            for (int i = 0; i < controller.exams.length; i++)
                              buildRowItems(
                                name: controller.exams[i].keys
                                    .toList()
                                    .toString()
                                    .substring(
                                        1,
                                        controller.exams[i].keys
                                                .toList()
                                                .toString()
                                                .length -
                                            1),
                                date: controller
                                    .exams[i][controller.exams[i].keys
                                        .toList()
                                        .toString()
                                        .substring(
                                            1,
                                            controller.exams[i].keys
                                                    .toList()
                                                    .toString()
                                                    .length -
                                                1)]
                                    .date,
                                time: controller
                                    .exams[i][controller.exams[i].keys
                                        .toList()
                                        .toString()
                                        .substring(
                                            1,
                                            controller.exams[i].keys
                                                    .toList()
                                                    .toString()
                                                    .length -
                                                1)]
                                    .time,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow buildRowItems({
  required String name,
  required String date,
  required String time,
}) {
  return DataRow(cells: [
    DataCell(Text(name)),
    DataCell(Text(date)),
    DataCell(Text(time)),
  ]);
}
