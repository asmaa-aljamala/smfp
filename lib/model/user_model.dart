class User {
  late String _id;
  late String _password;
  User(this._id, this._password);
  User.fromMap(dynamic obj) {
    _id = obj['id'];
    _password = obj['password'];
  }
  String get id => _id;
  String get password => _password;
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["password"] = _password;
    return map;
  }
}
