import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smfp/logic/controller/children_controller.dart';
import 'package:smfp/model/exam_model.dart';

class ExamController extends GetxController {
  ChildrenController childrenController = Get.put(ChildrenController());
  final CollectionReference _classCollectionRef =
      FirebaseFirestore.instance.collection('Class');
  final CollectionReference _subjectCollectionRef =
      FirebaseFirestore.instance.collection('Subject');
  final CollectionReference _examCollectionRef =
      FirebaseFirestore.instance.collection('Exam');
  final exams = [].obs;

  ExamController() {
    exams.value = [];
    getExams();
  }

  getExams() async {
    try {
      await _classCollectionRef
          .where('id',
              isEqualTo: childrenController.currentStudent.value.class_id)
          .get()
          .then(
        (value) {
          List subjects = value.docs[0]['subjects'];
          subjects.forEach((element) async {
            try {
              await _subjectCollectionRef
                  .where('id', isEqualTo: element)
                  .get()
                  .then(
                (value) async {
                  await _examCollectionRef
                      .where('subject_id', isEqualTo: element)
                      .get()
                      .then(
                    (value1) {
                      var exam = ExamModel.fromJson(value1.docs[0].data());

                      var examsMap = {value.docs[0]['name']: exam};
                      exams.add(examsMap);
                    },
                  );
                },
              );
            } catch (e) {
              print('no subjects');
            }
          });
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print('error when found class');
      print(e.toString());
    }
  }
}
