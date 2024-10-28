import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/app_bar_type.dart';
import 'package:flutter/material.dart';

class MyNoticeDetailScreen extends StatelessWidget {
  const MyNoticeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: EeatsColor.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: EeatsColor.gray50,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "[중요] 오리엔테이션날 일정 안내",
                      style: EeatsTextStyle.subTitle1(
                        color: EeatsColor.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "2024. 04. 18",
                      style: EeatsTextStyle.body3(
                        color: EeatsColor.gray500,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야응아니야닥츠닥츠닥츠닥츠닥츠닥츠닥츠닥츠닥츠닥츠닥츠",
                style: EeatsTextStyle.body3(
                  color: EeatsColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
