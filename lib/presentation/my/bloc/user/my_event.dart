abstract class MyEvent {}

class GetMyEvent extends MyEvent {}

class PatchAllergyEvent extends MyEvent {
  final List<int> type;
  PatchAllergyEvent({
    required this.type,
  });
}

class PatchProfileEvent extends MyEvent {
  final String nickname;
  PatchProfileEvent({
    required this.nickname,
  });
}
