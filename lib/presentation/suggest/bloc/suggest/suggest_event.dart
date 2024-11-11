abstract class SuggestEvent {}

class GetSuggestListEvent extends SuggestEvent {}

class PostSuggestEvent extends SuggestEvent {
  final String title, content;

  PostSuggestEvent({
    required this.title,
    required this.content,
  });
}
