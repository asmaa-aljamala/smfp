import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smfp/logic/controller/teacher_controller.dart';

import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class TeacherScreen extends StatelessWidget {
  TeacherScreen({Key? key}) : super(key: key);
  TeacherController controller = Get.put(TeacherController());

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
                          )),
                      const TextUtils(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        text: "أسماء المعلمين",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetX<TeacherController>(
                        builder: (controller) => ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var course = controller.teachers[index].keys
                                .toList()
                                .toString();
                            return buildTeacherItems(
                              image: controller
                                  .teachers[index]
                                      [course.substring(1, course.length - 1)]
                                  .image,
                              name: controller
                                  .teachers[index]
                                      [course.substring(1, course.length - 1)]
                                  .name,
                              courseName:
                                  course.substring(1, course.length - 1),
                            );
                          },
                          itemCount: controller.teachers.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
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

Widget buildTeacherItems({
  required String image,
  required String name,
  required String courseName,
}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: theme.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  courseName,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: theme.secondaryColor,
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
