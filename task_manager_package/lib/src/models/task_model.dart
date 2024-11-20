import 'dart:convert';

const kId = 'id';
const kTitle = 'title';
const kDescription = 'description';
const kCompleted = 'completed';

class TaskModel {
  final int id;
  final String title;
  final String description;
  final bool completed;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      kId: id,
      kTitle: title,
      kDescription: description,
      kCompleted: completed,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map[kId] as int,
      title: map[kTitle] as String,
      description: map[kDescription] as String,
      completed: map[kCompleted] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, completed: $completed)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        completed.hashCode;
  }
}
