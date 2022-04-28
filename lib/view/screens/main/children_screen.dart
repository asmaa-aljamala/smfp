import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smfp/logic/controller/children_controller.dart';

import 'package:smfp/utiles/theme.dart';

import 'package:smfp/view/widgets/text_utils.dart';

class ChildrenScreen extends StatelessWidget {
  ChildrenScreen({Key? key}) : super(key: key);
  final ChildrenController controller =
      Get.put(ChildrenController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    controller.studentModel.value = [];
    controller.getStudent();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
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
                        text: "أسماء الأبناء",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetX<ChildrenController>(
                        builder: (controller) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (() => controller.getCurrentStudent(
                                    id: controller.studentModel[index].id)),
                                child: buildChildItems(
                                  image: controller.studentModel[index].image,
                                  name: controller.studentModel[index].name,
                                ),
                              );
                            },
                            itemCount: controller.studentModel.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            // Do Something
          },
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/addUser.png')),
              borderRadius: BorderRadius.circular(0.50),
            ),
            width: 50.0,
            height: 50.0,
          ),
        ),
      ),
    );
  }
}

Widget buildChildItems({
  required String image,
  required String name,
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
            Text(
              name,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: theme.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

void _changePassword(String password) async {
  // here you write the codes to input the data into firestore
}
