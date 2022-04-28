class ExamModel {
  late String subjectId, examType, id, date, time;
  ExamModel(this.id, this.subjectId, this.examType, this.date, this.time);
  ExamModel.fromJson(map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    subjectId = map['subject_id'];
    examType = map['exam_type'];
    date = map['date'];
    time = map['time'];
  }
  toJson() {
    return {
      'id': id,
      'subject_id': subjectId,
      'exam_type': examType,
      'date': date,
      'time': time,
    };
  }
}
