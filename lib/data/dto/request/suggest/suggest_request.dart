class SuggestRequest {
  final String title, content;

  SuggestRequest({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
    };
  }
}
