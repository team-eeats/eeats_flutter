import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyNoticeWidget extends StatelessWidget {
  const MyNoticeWidget({super.key});

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
                    "오늘 급식 변경",
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
                "1일 전",
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
}
