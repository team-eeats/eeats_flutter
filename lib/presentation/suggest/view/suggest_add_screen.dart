import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:flutter/material.dart';

class SuggestAddScreen extends StatefulWidget {
  const SuggestAddScreen({super.key});

  @override
  State<SuggestAddScreen> createState() => _SuggestAddScreenState();
}

class _SuggestAddScreenState extends State<SuggestAddScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late FocusNode titleFocusNode;
  late FocusNode contentFocusNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    titleFocusNode = FocusNode();
    contentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "급식 건의하기",
                style: EeatsTextStyle.heading3(
                  color: EeatsColor.black,
                ),
              ),
              const SizedBox(height: 36),
              EeatsTextField(
                controller: titleController,
                focusNode: titleFocusNode,
                title: "제목",
                hintText: "제목을 입력해주세요.",
              ),
              const SizedBox(height: 28),
              EeatsTextField(
                controller: contentController,
                focusNode: contentFocusNode,
                height: 106,
                maxLength: 30,
                maxLines: 100,
                title: "건의 내용",
                hintText: "건의 내용을 30자 내외로 작성해주세요.",
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
