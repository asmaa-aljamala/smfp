import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smfp/main.dart';
import 'package:smfp/routes/routes.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                        text: "المعاملات الادارية",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.complaintScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/complaint.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'الشكاوي',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.reportScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/reports.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'التقارير',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.transferStudentScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/transfer.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'نقل الطالب من المدرسة',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.complaintScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/certificate.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'استخراج الشهادات',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.whoScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/who.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'من نحن',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          sharedPreferences.clear();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/who.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'تسجيل خروج',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
