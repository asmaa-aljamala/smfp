import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smfp/logic/controller/main_controller.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/screens/main/chat_screen.dart';
import 'package:smfp/view/screens/main/exams_screen.dart';
import 'package:smfp/view/screens/main/home_screen.dart';

import 'package:smfp/view/screens/main/more_screen.dart';
import 'package:smfp/view/screens/main/teacher_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);

  buildBottomNavigationMenu(context, controller) {
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex.value,
        unselectedItemColor: Colors.black,
        selectedItemColor: theme.mainColor,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.home_outlined,
                size: 25.0,
              ),
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.group_outlined,
                size: 25.0,
              ),
            ),
            label: 'المعلمون',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.table_chart_outlined,
                size: 25.0,
              ),
            ),
            label: 'الاختبارات',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.chat_outlined,
                size: 25.0,
              ),
            ),
            label: 'الرسائل',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.more_horiz,
                size: 25.0,
              ),
            ),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        body: Obx(() {
          return IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeScreen(),
              TeacherScreen(),
              ExamsScreen(),
              ChatScreen(),
              MoreScreen(),
            ],
          );
        }),
      ),
    );
  }
}
