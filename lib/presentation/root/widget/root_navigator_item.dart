import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/state/navigator_type.dart';
import 'package:eeats/presentation/root/provider/root_navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootNavigatorItem extends StatelessWidget {
  final NavigatorType type;

  const RootNavigatorItem({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootNavigatorCubit, NavigatorType>(
      builder: (context, state) {
        return EeatsGesture(
          event: () {
            if (state != type) {
              context.read<RootNavigatorCubit>().changeType(type: type);
            }
          },
          child: SizedBox(
            width: 94,
            height: 38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  type.icon,
                  colorFilter: ColorFilter.mode(
                    state == type ? EeatsColor.main500 : EeatsColor.gray300,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  type.text,
                  style: EeatsTextStyle.body4(
                    color: state == type ? EeatsColor.main500 : EeatsColor.gray300,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
