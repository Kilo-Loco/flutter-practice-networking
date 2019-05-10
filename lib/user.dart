class User {
  final int id;
  final String name;
  final int age;

  User({this.id, this.name, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }
}