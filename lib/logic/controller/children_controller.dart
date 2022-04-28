import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smfp/main.dart';
import 'package:smfp/model/student_model.dart';
import 'package:smfp/view/screens/main/main_screen.dart';

class ChildrenController extends GetxController {
  final CollectionReference _studentCollectionRef =
      FirebaseFirestore.instance.collection('Student');

  final studentModel = [].obs;

  final currentStudent = StudentModel('', '', '', '').obs;

  getStudent() async {
    try {
      await _studentCollectionRef
          .where('parent_id', isEqualTo: sharedPreferences.getString('id'))
          .get()
          .then(
        (value) {
          for (int i = 0; i < value.docs.length; i++) {
            studentModel.add(StudentModel.fromJson(value.docs[i].data()));
          }

          update();
        },
      );
    } catch (e) {
      print("$e :: eror when loading students");
    }
  }

  getCurrentStudent({required String id}) async {
    try {
      await _studentCollectionRef.where('id', isEqualTo: id).get().then(
        (value) {
          currentStudent.value = StudentModel.fromJson(value.docs[0].data());

          Get.to(() => MainScreen());
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
