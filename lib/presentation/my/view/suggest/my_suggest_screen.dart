import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/presentation/my/widget/suggest/my_suggest_item_widget.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySuggestScreen extends StatelessWidget {
  const MySuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mySuggestLength =
        context.watch<MySuggestBloc>().state.value.suggestions!.length;
    final mySuggestItem = context.watch<MySuggestBloc>().state;
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<MySuggestBloc>().add(GetMySuggestEvent()),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                switch (mySuggestItem.state) {
                  MySuggestRemoteState.initial => Center(
                      child: Text(
                        "인터넷 연결을 확인해주세요.",
                        textAlign: TextAlign.center,
                        style: EeatsTextStyle.label1(
                          color: EeatsColor.gray800,
                        ),
                      ),
                    ),
                  MySuggestRemoteState.failure => Center(
                      child: Text(
                        "인터넷 연결을 확인해주세요.",
                        textAlign: TextAlign.center,
                        style: EeatsTextStyle.label1(
                          color: EeatsColor.gray800,
                        ),
                      ),
                    ),
                  MySuggestRemoteState.loading =>
                    const Center(child: CupertinoActivityIndicator()),
                  MySuggestRemoteState.success => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mySuggestLength,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index == mySuggestLength - 1 ? 0 : 12),
                          child: MySuggestItemWidget(index: index),
                        );
                      },
                    ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
