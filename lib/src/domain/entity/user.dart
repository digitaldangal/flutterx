import 'package:meta/meta.dart';

class User {
  User({
    @required this.userId,
    @required this.email,
    this.name,
    this.avatarUrl,
    this.level,
  });

  String userId;
  String name;
  String email;
  String avatarUrl;
  int level;

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'email': email,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          name == other.name &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => email.hashCode ^ userId.hashCode;
}
