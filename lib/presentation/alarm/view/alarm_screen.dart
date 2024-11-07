import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index == 10 - 1 ? 0 : 12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "오늘 급식에 생선이 나와요. 주의하세요!",
                            style: EeatsTextStyle.label2(
                              color: EeatsColor.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset("$iconAlarmAsset/unread_alarm_icon.svg"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "8일 전",
                        style: EeatsTextStyle.label3(
                          color: EeatsColor.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
