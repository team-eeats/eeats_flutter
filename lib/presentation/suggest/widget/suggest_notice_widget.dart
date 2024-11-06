import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuggestNoticeWidget extends StatelessWidget {
  const SuggestNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: EeatsColor.main0,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset("$iconSuggestAsset/speaker_icon.svg"),
            const SizedBox(width: 10),
            Text(
              "급식에 대한 의견을 자유롭게 작성해주세요!",
              style: EeatsTextStyle.label3(
                color: EeatsColor.gray800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
