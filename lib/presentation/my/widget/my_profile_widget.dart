import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/dummy/allergy_list.dart';
import 'package:eeats/domain/entity/user/my_entity.dart';
import 'package:eeats/presentation/my/bloc/user/my_bloc.dart';
import 'package:eeats/presentation/my/bloc/user/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBloc, MyState<MyEntity>>(
      builder: (context, state) {
        final userInfo = context.watch<MyBloc>().state;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userInfo.value.nickname!,
                    style: EeatsTextStyle.body2(
                      color: EeatsColor.black,
                    ),
                  ),
                  EeatsGesture(
                    event: () => context.push(
                      "/nickname",
                      extra: userInfo.value.nickname!,
                    ),
                    child: Text(
                      "수정하기",
                      style: EeatsTextStyle.body4(
                        color: EeatsColor.gray300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              direction: Axis.horizontal,
              // 나열 방향
              alignment: WrapAlignment.start,
              // 정렬 방식
              spacing: 8,
              // 좌우 간격
              runSpacing: 8,
              // 상하 간격
              children: [
                for (int i = 0; i < 3; i++)
                  FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: EeatsColor.main300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: Text(
                          allergyData.values.elementAt(i),
                          style: EeatsTextStyle.label3(
                            color: EeatsColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
