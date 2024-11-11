import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MySuggestDialog extends StatelessWidget {
  final String title, content, uuid;

  const MySuggestDialog({
    super.key,
    required this.title,
    required this.content,
    required this.uuid,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: EeatsColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EeatsGesture(
              event: () {
                context.pop();
                context.push(
                  "/editSuggest",
                  extra: {
                    "title": title,
                    "content": content,
                    "uuid" : uuid,
                  },
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "수정하기",
                    textAlign: TextAlign.center,
                    style: EeatsTextStyle.button2(
                      color: EeatsColor.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: EeatsColor.gray50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "삭제하기",
                  textAlign: TextAlign.center,
                  style: EeatsTextStyle.button2(
                    color: EeatsColor.main500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
