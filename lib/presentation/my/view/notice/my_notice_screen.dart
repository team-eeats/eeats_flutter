import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_event.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_state.dart';
import 'package:eeats/presentation/my/widget/notice/my_notice_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyNoticeScreen extends StatefulWidget {
  const MyNoticeScreen({super.key});

  @override
  State<MyNoticeScreen> createState() => _MyNoticeScreenState();
}

class _MyNoticeScreenState extends State<MyNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    final noticeLength =
        context.watch<NoticeBloc>().state.value.notices!.length;
    final noticeList = context.watch<NoticeBloc>().state;
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<NoticeBloc>().add(GetNoticeEvent());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: switch (noticeList.state) {
              NoticeRemoteState.initial => Center(
                  child: Text(
                    "인터넷 연결을 확인해주세요.",
                    textAlign: TextAlign.center,
                    style: EeatsTextStyle.label1(
                      color: EeatsColor.gray800,
                    ),
                  ),
                ),
              NoticeRemoteState.loading => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              NoticeRemoteState.failure => Center(
                  child: Text(
                    "인터넷 연결을 확인해주세요.",
                    textAlign: TextAlign.center,
                    style: EeatsTextStyle.label1(
                      color: EeatsColor.gray800,
                    ),
                  ),
                ),
              NoticeRemoteState.success => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: noticeLength,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == noticeLength - 1 ? 0 : 12),
                      child: EeatsGesture(
                        event: () => context.push(
                          "/noticeDetail",
                          extra: noticeList.value.notices![index],
                        ),
                        child: MyNoticeWidget(
                            item: noticeList.value.notices![index]),
                      ),
                    );
                  },
                ),
            },
          ),
        ),
      ),
    );
  }
}
