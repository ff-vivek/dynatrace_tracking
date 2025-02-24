// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodoStruct extends BaseStruct {
  TodoStruct({
    String? title,
    bool? completed,
    int? userId,
    int? id,
  })  : _title = title,
        _completed = completed,
        _userId = userId,
        _id = id;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static TodoStruct fromMap(Map<String, dynamic> data) => TodoStruct(
        title: data['title'] as String?,
        completed: data['completed'] as bool?,
        userId: castToType<int>(data['userId']),
        id: castToType<int>(data['id']),
      );

  static TodoStruct? maybeFromMap(dynamic data) =>
      data is Map ? TodoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'completed': _completed,
        'userId': _userId,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static TodoStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodoStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TodoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodoStruct &&
        title == other.title &&
        completed == other.completed &&
        userId == other.userId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([title, completed, userId, id]);
}

TodoStruct createTodoStruct({
  String? title,
  bool? completed,
  int? userId,
  int? id,
}) =>
    TodoStruct(
      title: title,
      completed: completed,
      userId: userId,
      id: id,
    );
