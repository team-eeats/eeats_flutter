import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/domain/entity/notice/notice_entity.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_event.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyNoticeDetailScreen extends StatefulWidget {
  final NoticeEntity item;

  const MyNoticeDetailScreen({
    super.key,
    required this.item,
  });

  @override
  State<MyNoticeDetailScreen> createState() => _MyNoticeDetailScreenState();
}

class _MyNoticeDetailScreenState extends State<MyNoticeDetailScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoticeDetailBloc>().add(GetNoticeDetailEvent(noticeId: widget.item.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    final noticeDetailState = context.watch<NoticeDetailBloc>().state.state;
    final noticeDetail = context.watch<NoticeDetailBloc>().state.value;
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: switch (noticeDetailState) {
            NoticeDetailRemoteState.initial => Center(
              child: Text(
                "인터넷 연결을 확인해주세요.",
                textAlign: TextAlign.center,
                style: EeatsTextStyle.label1(
                  color: EeatsColor.gray800,
                ),
              ),
            ),
            NoticeDetailRemoteState.loading => const Center(
              child: CupertinoActivityIndicator(),
            ),
            NoticeDetailRemoteState.failure => Center(
              child: Text(
                "인터넷 연결을 확인해주세요.",
                textAlign: TextAlign.center,
                style: EeatsTextStyle.label1(
                  color: EeatsColor.gray800,
                ),
              ),
            ),
            NoticeDetailRemoteState.success => Column(
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
                        noticeDetail.title!,
                        style: EeatsTextStyle.subTitle1(
                          color: EeatsColor.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        DateFormat("yyyy. MM. dd").format(DateTime.parse(noticeDetail.createdAt!)),
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
                  noticeDetail.content!,
                  style: EeatsTextStyle.body3(
                    color: EeatsColor.black,
                  ),
                ),
              ],
            ),
          }
        ),
      ),
    );
  }
}
