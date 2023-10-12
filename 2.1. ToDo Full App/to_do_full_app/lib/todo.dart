class Todo {
  String taskDetails;
  DateTime createdDateTime, updatedDateTime;
  String status;

  Todo(
      {required this.taskDetails,
      required this.createdDateTime,
      required this.updatedDateTime,
      this.status = 'pending',
      });
}
