import 'package:eeats/core/di/eeats_asset.dart';

enum NavigatorType {
  home(
    icon: "$iconNavigatorAsset/home_icon.svg",
    text: "홈",
  ),
  suggest(
    icon: "$iconNavigatorAsset/suggest_icon.svg",
    text: "건의",
  ),
  vote(
    icon: "$iconNavigatorAsset/vote_icon.svg",
    text: "투표",
  ),
  my(
    icon: "$iconNavigatorAsset/my_icon.svg",
    text: "마이페이지",
  );

  final String icon, text;

  const NavigatorType({
    required this.icon,
    required this.text,
  });
}
