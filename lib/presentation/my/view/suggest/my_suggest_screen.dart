import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/app_bar_type.dart';
import 'package:eeats/presentation/my/widget/suggest/my_suggest_item_widget.dart';
import 'package:flutter/material.dart';

class MySuggestScreen extends StatelessWidget {
  const MySuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "내 건의 보기",
                style: EeatsTextStyle.heading3(
                  color: EeatsColor.black,
                ),
              ),
              const SizedBox(height: 28),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 100 - 1 ? 0 : 12),
                    child: const MySuggestItemWidget(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
