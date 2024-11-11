abstract class MySuggestEvent {}

class GetMySuggestEvent extends MySuggestEvent {}

class EditMySuggestEvent extends MySuggestEvent {
  final String title, content, uuid;

  EditMySuggestEvent({
    required this.title,
    required this.content,
    required this.uuid,
  });
}

class DeleteMySuggestEvent extends MySuggestEvent {
  final String uuid;

  DeleteMySuggestEvent({
    required this.uuid,
  });
}
