import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:smfp/model/student_model.dart';
import 'package:smfp/view/screens/main/main_screen.dart';

class StudentController extends GetxController {
  // final CollectionReference _studentCollectionRef =
  //     FirebaseFirestore.instance.collection('Student');
  // StudentModel _currentStudent =
  //     StudentModel(id: 'id', name: 'name', image: 'image');
  // StudentModel get currentStudent => _currentStudent;
  // getCurrentStudent({
  //   required String id,
  // }) async {
  //   await _studentCollectionRef.where('id', isEqualTo: id).get().then(
  //     (value) {
  //       print('^^^^^^^^^^^^^^^^^^^^^^');
  //       print(value.docs[0]['name']);
  //       _currentStudent = StudentModel.fromJson(value.docs[0].data());
  //       print('#####################');
  //       print(currentStudent.name);
  //       update();
  //       Get.to(MainScreen());
  //     },
  //   );
  // }
}
