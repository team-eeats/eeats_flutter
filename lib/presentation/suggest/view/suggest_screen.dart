import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/presentation/suggest/widget/suggest_floating_button.dart';
import 'package:eeats/presentation/suggest/widget/suggest_item_widget.dart';
import 'package:eeats/presentation/suggest/widget/suggest_notice_widget.dart';
import 'package:flutter/material.dart';

class SuggestScreen extends StatelessWidget {
  const SuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const SuggestFloatingButton(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              const SuggestNoticeWidget(),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 10 - 1 ? 0 : 12),
                    child: const SuggestItemWidget(),
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
