import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SuggestFloatingButton extends StatelessWidget {
  const SuggestFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/addSuggest"),
      child: Container(
        decoration: BoxDecoration(
          color: EeatsColor.main500,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "급식 건의하기",
                style: EeatsTextStyle.button3(
                  color: EeatsColor.white,
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset("$iconSuggestAsset/pencil_icon.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
