import 'package:meta/meta.dart';

class User {
  User({
    @required this.userId,
    @required this.email,
    this.name,
    this.avatarUrl,
    this.level,
  });

  final String userId;
  final String name;
  final String email;
  final String avatarUrl;
  final int level;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              email == other.email &&
              name == other.name &&
              avatarUrl == other.avatarUrl;

  @override
  int get hashCode =>
      email.hashCode ^
      userId.hashCode;
}