import 'package:meta/meta.dart';

class Course {
  Course({
    @required this.courseId,
    @required this.userId,
    this.title,
    this.pictureUrl,
    this.level,
  });

  final String courseId;
  final String userId;
  final String title;
  final String pictureUrl;
  final int level;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Course &&
          runtimeType == other.runtimeType &&
          courseId == other.courseId;

  @override
  int get hashCode => courseId.hashCode;
}
