import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:flutter/cupertino.dart';

class MyAlarmScreen extends StatelessWidget {
  const MyAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "알림 설정",
              style: EeatsTextStyle.heading3(
                color: EeatsColor.black,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "전체 알림",
                    style: EeatsTextStyle.body2(
                      color: EeatsColor.gray600,
                    ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    activeColor: EeatsColor.main300,
                    trackColor: EeatsColor.gray100,
                    thumbColor: EeatsColor.white,
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                decoration: BoxDecoration(
                  color: EeatsColor.gray50,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "세부 알림",
                style: EeatsTextStyle.body3(
                  color: EeatsColor.gray300,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
