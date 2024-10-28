import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/help_guide_type.dart';
import 'package:eeats/presentation/my/widget/logout/my_logout_dialog.dart';
import 'package:eeats/presentation/my/widget/my_option_content_widget.dart';
import 'package:eeats/presentation/my/widget/my_option_title_widget.dart';
import 'package:eeats/presentation/my/widget/my_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyProfileWidget(),
            const SizedBox(height: 28),
            const MyOptionTitleWidget(
              text: "도움말",
            ),
            const SizedBox(height: 8),
            MyOptionContentWidget(
              type: HelpGuideType.notice,
              event: () => context.push("/notice"),
            ),
            const SizedBox(height: 8),
            MyOptionContentWidget(
              type: HelpGuideType.allergy,
              event: () => context.push("/allergy"),
            ),
            const SizedBox(height: 8),
            MyOptionContentWidget(
              type: HelpGuideType.suggest,
              event: () => context.push("/mySuggest"),
            ),
            const SizedBox(height: 8),
            MyOptionContentWidget(
              type: HelpGuideType.alarm,
              event: () => context.push("/myAlarm"),
            ),
            const SizedBox(height: 28),
            const MyOptionTitleWidget(
              text: "계정",
            ),
            const SizedBox(height: 8),
            MyOptionContentWidget(
              type: HelpGuideType.logout,
              event: () => showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return const MyLogoutDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
