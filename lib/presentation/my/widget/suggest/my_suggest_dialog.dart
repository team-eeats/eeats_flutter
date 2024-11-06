import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';

class MySuggestDialog extends StatelessWidget {
  const MySuggestDialog({super.key});

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "수정하기",
                style: EeatsTextStyle.button2(
                  color: EeatsColor.black,
                ),
              ),
            ),
            Container(
              height: 1,
              color: EeatsColor.gray50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "삭제하기",
                style: EeatsTextStyle.button2(
                  color: EeatsColor.main500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
