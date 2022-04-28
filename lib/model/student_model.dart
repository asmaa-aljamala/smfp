class StudentModel {
  late String name, image, id, class_id;
  StudentModel(this.id, this.name, this.image, this.class_id);
  StudentModel.fromJson(map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    image = map['image'];
    class_id = map['class_id'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'class_id': class_id,
    };
  }
}
