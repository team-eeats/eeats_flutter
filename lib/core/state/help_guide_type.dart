import 'package:eeats/core/di/eeats_asset.dart';

enum HelpGuideType {
  notice(
    text: "공지사항",
    icon: "$iconMyAsset/megaphone_icon.svg",
  ),
  allergy(
    text: "내가 갖고 있는 알레르기 변경",
    icon: "$iconMyAsset/medicine_icon.svg",
  ),
  suggest(
    text: "내 건의 보기",
    icon: "$iconMyAsset/document_icon.svg",
  ),
  alarm(
    text: "알림 설정",
    icon: "$iconCoreAsset/alarm_icon.svg",
  ),
  logout(
    text: "로그아웃",
    icon: "$iconMyAsset/logout_icon.svg",
  );

  final String text, icon;

  const HelpGuideType({
    required this.text,
    required this.icon,
  });
}
