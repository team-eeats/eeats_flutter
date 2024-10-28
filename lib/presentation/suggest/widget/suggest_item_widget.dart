import 'package:eeats/core/constants/eeats_style.dart';
import 'package:flutter/material.dart';

class SuggestItemWidget extends StatelessWidget {
  const SuggestItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: EeatsColor.gray50,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "멋진 토마토",
                  style: EeatsTextStyle.body3(
                    color: EeatsColor.main200,
                  ),
                ),
                Text(
                  "8월 28일",
                  style: EeatsTextStyle.body4(
                    color: EeatsColor.gray300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "선생님 밥이 사악 맛있어요ㅜㅜ!",
              style: EeatsTextStyle.body2(
                color: EeatsColor.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "선생님 밥이 사악 맛있어요ㅜㅜ!",
              style: EeatsTextStyle.body4(
                color: EeatsColor.gray600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
