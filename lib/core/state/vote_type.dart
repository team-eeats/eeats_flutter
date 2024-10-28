enum VoteType {
  open(
    text: "현재 진행 중인 투표",
    offset: -1,
    page: 0,
  ),
  close(
    text: "종료된 투표",
    offset: 1,
    page: 1,
  );

  final String text;
  final double offset;
  final int page;

  const VoteType({
    required this.text,
    required this.offset,
    required this.page,
  });
}
