import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EeatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType? type;

  const EeatsAppBar({
    super.key,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          /// 자동으로 Leading Widget이 생성되지 않도록 설정
          automaticallyImplyLeading: false,

          /// 스크롤 할 시 아래의 Elevation 설정
          scrolledUnderElevation: 0,
          backgroundColor: EeatsColor.white,

          /// title 위젯의 기본 간격 해제
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: type == AppBarType.pop
                  ? [
                      EeatsGesture(
                        event: () => context.pop(),
                        child: SvgPicture.asset(
                          "$iconCoreAsset/left_arrow_icon.svg",
                          colorFilter: const ColorFilter.mode(
                            EeatsColor.gray900,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ]
                  : [
                      Image.asset(
                        "$imageCoreAsset/eeats_image.png",
                        width: 64,
                        height: 28,
                      ),
                      EeatsGesture(
                        event: () => context.push("/alarm"),
                        child: SvgPicture.asset(
                          "$iconCoreAsset/alarm_icon.svg",
                          colorFilter: const ColorFilter.mode(
                            EeatsColor.gray900,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(38);
}
