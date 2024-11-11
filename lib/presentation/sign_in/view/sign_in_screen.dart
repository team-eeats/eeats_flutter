import 'package:eeats/core/component/eeats_button.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/provider/text_field_empty_cubit.dart';
import 'package:eeats/core/provider/text_field_focus_cubit.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/presentation/home/bloc/home_bloc.dart';
import 'package:eeats/presentation/home/bloc/home_event.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_event.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  late FocusNode idFocusNode;
  late FocusNode pwdFocusNode;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController()..addListener(_onChanged);
    pwdController = TextEditingController()..addListener(_onChanged);

    idFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
  }

  @override
  void dispose() {
    idController.dispose();
    pwdController.dispose();

    idFocusNode.dispose();
    pwdFocusNode.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (idController.text.isNotEmpty && pwdController.text.isNotEmpty) {
      context.read<TextFieldEmptyCubit>().changeFill();
    } else {
      context.read<TextFieldEmptyCubit>().changeEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = context.watch<TextFieldFocusCubit>().state;
    final emptyValue = context.watch<TextFieldEmptyCubit>().state;
    final signInHandlerState = context.watch<SignInBloc>().state;
    return BlocListener<SignInBloc, SignInState<TokenEntity>>(
      listenWhen: (previous, current) => current.state == SignInRemoteState.success,
      listener: (context, state) {
        context.read<SuggestBloc>().add(GetSuggestListEvent());
        context.read<MySuggestBloc>().add(GetMySuggestEvent());
        context.read<NoticeBloc>().add(GetNoticeEvent());
        context.read<HomeBloc>().add(GetMealEvent(
            date: DateFormat("yyyyMMdd").format(DateTime.now())));
        context.go("/root");
      },
      child: EeatsLayout(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: focusValue ? 0 : 24),
            child: EeatsButton(
              event: () {
                if (emptyValue) {
                  context.read<SignInBloc>().add(
                    PostSignInEvent(accountId: idController.text, password: pwdController.text),
                  );
                }
              },
              backgroundColor: emptyValue ? EeatsColor.main500 : EeatsColor.main100,
              content: Text(
                "로그인하기",
                style: EeatsTextStyle.button2(
                  color: EeatsColor.white,
                ),
              ),
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  "로그인하고\n잇츠를 사용해보세요!",
                  style: EeatsTextStyle.heading3(
                    color: EeatsColor.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "XQUARE 계정으로 로그인 해주세요.",
                  style: EeatsTextStyle.caption3(
                    color: EeatsColor.gray400,
                  ),
                ),
                const SizedBox(height: 40),
                EeatsTextField(
                  title: "아이디",
                  controller: idController,
                  focusNode: idFocusNode,
                  error: signInHandlerState.state == SignInRemoteState.failure,
                  hintText: "아이디를 입력해주세요.",
                ),
                const SizedBox(height: 28),
                EeatsTextField(
                  title: "비밀번호",
                  controller: pwdController,
                  focusNode: pwdFocusNode,
                  error: signInHandlerState.state == SignInRemoteState.failure,
                  hintText: "비밀번호를 입력해주세요.",
                  password: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12),
                if (signInHandlerState.state == SignInRemoteState.failure)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "아이디 또는 비밀번호가 일치하지 않습니다.",
                      style: EeatsTextStyle.label3(
                        color: EeatsColor.main500,
                      ),
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
