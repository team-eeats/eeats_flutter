import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_state.dart';
import 'package:eeats/presentation/suggest/widget/suggest_floating_button.dart';
import 'package:eeats/presentation/suggest/widget/suggest_item_widget.dart';
import 'package:eeats/presentation/suggest/widget/suggest_notice_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestScreen extends StatefulWidget {
  const SuggestScreen({super.key});

  @override
  State<SuggestScreen> createState() => _SuggestScreenState();
}

class _SuggestScreenState extends State<SuggestScreen> {
  @override
  Widget build(BuildContext context) {
    final suggestLength =
        context.watch<SuggestBloc>().state.value.suggestions!.length;
    final suggestList = context.watch<SuggestBloc>().state;
    return EeatsLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const SuggestFloatingButton(),
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<SuggestBloc>().add(GetSuggestListEvent()),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                const SuggestNoticeWidget(),
                const SizedBox(height: 16),
                switch (suggestList.state) {
                  SuggestRemoteState.initial => Center(
                      child: Text(
                        "인터넷 연결을 확인해주세요.",
                        textAlign: TextAlign.center,
                        style: EeatsTextStyle.label1(
                          color: EeatsColor.gray800,
                        ),
                      ),
                    ),
                  SuggestRemoteState.failure => Center(
                      child: Text(
                        "인터넷 연결을 확인해주세요.",
                        textAlign: TextAlign.center,
                        style: EeatsTextStyle.label1(
                          color: EeatsColor.gray800,
                        ),
                      ),
                    ),
                  SuggestRemoteState.loading => const Center(child: CupertinoActivityIndicator()),
                  SuggestRemoteState.success => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: suggestLength,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index == suggestLength - 1 ? 0 : 12),
                          child: SuggestItemWidget(index: index),
                        );
                      },
                    ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
