import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    idController = TextEditingController();
    pwdController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: EeatsGesture(
            event: () => context.go("/root"),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 43,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: EeatsColor.main500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "로그인하기",
                  style: EeatsTextStyle.button2(
                    color: EeatsColor.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
              hintText: "아이디를 입력해주세요.",
            ),
            const SizedBox(height: 28),
            EeatsTextField(
              title: "비밀번호",
              controller: pwdController,
              focusNode: pwdFocusNode,
              hintText: "비밀번호를 입력해주세요.",
              password: true,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
