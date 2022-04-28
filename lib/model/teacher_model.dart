class TeacherModel {
  late String name, image, id;
  TeacherModel(this.id, this.name, this.image);
  TeacherModel.fromJson(map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
