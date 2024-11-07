import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_outlined_button.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:flutter/material.dart';

class MyEditNicknameScreen extends StatefulWidget {
  const MyEditNicknameScreen({super.key});

  @override
  State<MyEditNicknameScreen> createState() => _MyEditNicknameScreenState();
}

class _MyEditNicknameScreenState extends State<MyEditNicknameScreen> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: EeatsOutlinedButton(
        event: () {},
        backgroundColor: EeatsColor.main500,
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
              hintText: "빨간색 토마토",
            ),
          ],
        ),
      ),
    );
  }
}
