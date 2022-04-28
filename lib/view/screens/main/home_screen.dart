import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smfp/logic/controller/children_controller.dart';

import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/screens/main/homework_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    GetX<ChildrenController>(
                      init: ChildrenController(),
                      builder: (controller) => Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                controller.currentStudent.value.image),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            controller.currentStudent.value.name,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.notifications,
                              color: theme.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/mainphoto.png',
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover)),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 5.0,
                          crossAxisCount: 2,
                          children: [
                            buildMainCard(
                              image: 'assets/images/marks.png',
                              name: 'الدرجات',
                            ),
                            InkWell(
                              onTap: () => Get.to(() => HomeworkScreen()),
                              child: buildMainCard(
                                image: 'assets/images/homework.png',
                                name: 'الواجبات',
                              ),
                            ),
                            buildMainCard(
                              image: 'assets/images/scheduals.png',
                              name: 'الجدول الأسبوعي',
                            ),
                            buildMainCard(
                              image: 'assets/images/attendance.png',
                              name: 'الحضور والغياب',
                            ),
                          ],
                        ),
                      ],
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

Widget buildMainCard({
  required String image,
  required String name,
}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
