import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/domain/entity/notice/notice_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyNoticeWidget extends StatelessWidget {
  final NoticeEntity item;

  const MyNoticeWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("$iconMyAsset/comment_icon.svg"),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.title,
                    style: EeatsTextStyle.label2(
                      color: EeatsColor.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset("$iconMyAsset/unread_notice_icon.svg"),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                formatDate(item.createdAt),
                style: EeatsTextStyle.label3(
                  color: EeatsColor.gray600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  String formatDate(String date) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(DateTime.parse(date));

    if (difference.inDays == 0) {
      return "오늘";
    } else {
      return "${difference.inDays}일 전"; // n일 전인 경우
    }
  }
}
