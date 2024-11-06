import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/presentation/my/widget/suggest/my_suggest_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySuggestItemWidget extends StatelessWidget {
  const MySuggestItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EeatsColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: EeatsColor.gray50,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "멋진 토마토",
                      style: EeatsTextStyle.body3(
                        color: EeatsColor.main200,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      "8월 28일",
                      style: EeatsTextStyle.body3(
                        color: EeatsColor.gray300,
                      ),
                    ),
                  ],
                ),
                EeatsGesture(
                  event: () => showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return const MySuggestDialog();
                    },
                  ),
                  child:
                      SvgPicture.asset("$iconMyAsset/dots_vertical_icon.svg"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "밥이 사악 마있어영!",
              style: EeatsTextStyle.body2(
                color: EeatsColor.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "선생님밥이사악맛없어오ㅛ!",
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
