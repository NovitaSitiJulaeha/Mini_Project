class ChecklistModel {
  late int? id;
  late String? task;
  late String? notes;
  late bool? isCompleted;

  ChecklistModel({this.id, this.notes, this.isCompleted, required this.task});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'notes': notes,
      'isCompleted': isCompleted,
    };
  }

  ChecklistModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    task = map['task'];
    notes = map['notes'];
    isCompleted = map['isCompleted'];
  }
}
