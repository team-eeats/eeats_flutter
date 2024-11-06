import 'package:eeats/core/component/eeats_button.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLogoutDialog extends StatelessWidget {
  const MyLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: EeatsColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "정말 로그아웃 하시겠습니까?",
                style: EeatsTextStyle.label2(
                  color: EeatsColor.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "기기 내 계정에서 로그아웃 할 수 있어요.\n다음 이용 시에는 다시 로그인 해야합니다.",
                style: EeatsTextStyle.label3(
                  color: EeatsColor.gray500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: EeatsButton(
                      height: 35,
                      backgroundColor: EeatsColor.gray50,
                      radius: 4,
                      hasPadding: false,
                      content: Text(
                        "취소",
                        style: EeatsTextStyle.button2(
                          color: EeatsColor.gray500,
                        ),
                      ),
                      event: () => context.pop(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: EeatsButton(
                      height: 35,
                      backgroundColor: EeatsColor.main500,
                      radius: 4,
                      hasPadding: false,
                      content: Text(
                        "확인",
                        style: EeatsTextStyle.button2(
                          color: EeatsColor.white,
                        ),
                      ),
                      event: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
