import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_button.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/provider/text_field_empty_cubit.dart';
import 'package:eeats/core/provider/text_field_focus_cubit.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MySuggestEditScreen extends StatefulWidget {
  final String title, content, uuid;

  const MySuggestEditScreen({
    super.key,
    required this.title,
    required this.content,
    required this.uuid,
  });

  @override
  State<MySuggestEditScreen> createState() => _MySuggestEditScreenState();
}

class _MySuggestEditScreenState extends State<MySuggestEditScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late FocusNode titleFocusNode;
  late FocusNode contentFocusNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title)
      ..addListener(_onChanged);
    contentController = TextEditingController(text: widget.content)
      ..addListener(_onChanged);
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

  void _onChanged() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      context.read<TextFieldEmptyCubit>().changeFill();
    } else {
      context.read<TextFieldEmptyCubit>().changeEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = context.watch<TextFieldFocusCubit>().state;
    final emptyValue = context.watch<TextFieldEmptyCubit>().state;
    return BlocListener<MySuggestBloc, MySuggestState<SuggestListEntity>>(
      listenWhen: (previous, current) {
        return previous.state != current.state &&
            current.state == MySuggestRemoteState.success;
      },
      listener: (context, state) {
        if (state.state == MySuggestRemoteState.success) {
          context.pop();
        }
      },
      child: EeatsLayout(
        appBar: const EeatsAppBar(type: AppBarType.pop),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: focusValue ? 0 : 24),
            child: EeatsButton(
              event: () {
                if (emptyValue) {
                  context.read<MySuggestBloc>().add(
                        EditMySuggestEvent(
                          title: titleController.text,
                          content: contentController.text,
                          uuid: widget.uuid,
                        ),
                      );
                }
              },
              backgroundColor:
                  emptyValue ? EeatsColor.main500 : EeatsColor.main100,
              content: Text(
                "건의하기",
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
      ),
    );
  }
}
