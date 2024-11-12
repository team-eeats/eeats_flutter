import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_outlined_button.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/provider/text_field_empty_cubit.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/domain/entity/user/my_entity.dart';
import 'package:eeats/presentation/my/bloc/user/my_bloc.dart';
import 'package:eeats/presentation/my/bloc/user/my_event.dart';
import 'package:eeats/presentation/my/bloc/user/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyEditNicknameScreen extends StatefulWidget {
  final String nickname;

  const MyEditNicknameScreen({
    super.key,
    required this.nickname,
  });

  @override
  State<MyEditNicknameScreen> createState() => _MyEditNicknameScreenState();
}

class _MyEditNicknameScreenState extends State<MyEditNicknameScreen> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController()..addListener(_onChanged);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (controller.text.isNotEmpty) {
      context.read<TextFieldEmptyCubit>().changeFill();
    } else {
      context.read<TextFieldEmptyCubit>().changeEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    final emptyValue = context.watch<TextFieldEmptyCubit>().state;
    return BlocListener<MyBloc, MyState<MyEntity>>(
      listenWhen: (previous, current) {
        return previous.state != current.state &&
            current.state == MyRemoteState.success;
      },
      listener: (context, state) {
        if (state.state == MyRemoteState.success) {
          context.go("/root");
          context.read<MyBloc>().add(GetMyEvent());
        }
      },
      child: EeatsLayout(
        appBar: const EeatsAppBar(type: AppBarType.pop),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: EeatsOutlinedButton(
          event: () {
            if (emptyValue && controller.text != widget.nickname) {
              context.read<MyBloc>().add(
                    PatchProfileEvent(nickname: controller.text),
                  );
            }
          },
          backgroundColor: emptyValue && controller.text != widget.nickname
              ? EeatsColor.main500
              : EeatsColor.main100,
          content: Text(
            "수정하기",
            style: EeatsTextStyle.button2(
              color: EeatsColor.white,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "닉네임 수정하기",
                style: EeatsTextStyle.heading3(
                  color: EeatsColor.black,
                ),
              ),
              const SizedBox(height: 36),
              EeatsTextField(
                controller: controller,
                focusNode: focusNode,
                title: "닉네임",
                hintText: "새로운 닉네임을 입력해주세요.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
