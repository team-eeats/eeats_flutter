class AllergyRequest {
  final List<int> type;

  AllergyRequest({
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "type" : type,
    };
  }
}
