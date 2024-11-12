class ProfileRequest {
  final String nickname;

  ProfileRequest({
    required this.nickname,
  });

  Map<String, dynamic> toJson() {
    return {
      "nickname" : nickname,
    };
  }
}
