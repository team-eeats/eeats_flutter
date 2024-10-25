import 'package:eeats/core/constants/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EeatsTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final double? width, height;

  final String title;
  final String? hintText;

  final bool? password, autofocus;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final TextInputFormatter? textInputFormatter;

  const EeatsTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    this.height,
    this.width,
    this.password = false,
    this.autofocus = false,
    this.maxLength,
    this.hintText,
    this.textInputFormatter,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });

  @override
  State<EeatsTextField> createState() => _EeatsTextFieldState();
}

class _EeatsTextFieldState extends State<EeatsTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: EeatsTextStyle.label2(
            color: EeatsColor.black,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height ?? 40,
          width: widget.width ?? MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,

            textInputAction: widget.textInputAction,

            autofocus: widget.autofocus!,

            /// 입력 포맷팅 설정
            inputFormatters: widget.textInputFormatter != null
                ? [widget.textInputFormatter!]
                : [],

            /// cursor 스타일 설정
            cursorHeight: 16,
            cursorWidth: 1,

            /// 입력 가능한 최대 길이
            maxLength: widget.maxLength,

            /// 비밀번호 obscure 설정
            obscureText: widget.password! && !_isClicked ? true : false,

            /// 키보드 입력 타입
            keyboardType: widget.textInputType,

            style: EeatsTextStyle.caption3(
              color: EeatsColor.black,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: EeatsTextStyle.caption3(
                color: EeatsColor.gray300,
              ),

              /// 텍스트 필드 색상 설정
              filled: true,
              fillColor: EeatsColor.gray0,

              /// content padding을 줌으로써 가운데 정렬
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),

              /// Outline 제거
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),

              /// suffixIcon -> 포커스 되지 않았을 때도 표시
              /// suffix -> 포커스 되었을 때만 표시
              suffixIcon: widget.password!
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isClicked = !_isClicked;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          /// 중복 코드 최소화
                          "$iconCoreAsset/eyes${!_isClicked ? "_off" : ""}_icon.svg",
                        ),
                      ),
                    )
                  : null,

              /// 텍스트 필드가 포커스 되었을 때
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: EeatsColor.main200,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),

              /// 텍스트 필드가 포커스 되지 않았을 때
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: EeatsColor.gray0,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
            ),

            onTap: () {
              /// 텍스트 필드가 포커스 된 상태에서 텍스트 필드를 클릭하면 포커스 해제
              FocusScope.of(context).hasFocus
                  ? FocusScope.of(context).unfocus()
                  : FocusScope.of(context).hasFocus;
            },

            /// 바깥 영역을 클릭 시 포커스 해제
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        )
      ],
    );
  }
}
