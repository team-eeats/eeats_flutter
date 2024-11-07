import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/presentation/my/widget/notice/my_notice_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNoticeScreen extends StatelessWidget {
  const MyNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index == 100 - 1 ? 0 : 12),
                child: EeatsGesture(
                  event: () => context.push("/noticeDetail"),
                  child: const MyNoticeWidget(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
