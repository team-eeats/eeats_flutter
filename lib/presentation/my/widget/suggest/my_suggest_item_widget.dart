import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/presentation/my/widget/suggest/my_suggest_dialog.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MySuggestItemWidget extends StatelessWidget {
  final int index;

  const MySuggestItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySuggestBloc, MySuggestState<SuggestListEntity>>(
      builder: (context, state) {
        final mySuggestItem = state.value.suggestions![index];
        return Container(
          decoration: BoxDecoration(
            color: EeatsColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 0.5,
              color: mySuggestItem.comment != null
                  ? EeatsColor.main200
                  : EeatsColor.gray50,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          mySuggestItem.accountId,
                          style: EeatsTextStyle.body3(
                            color: EeatsColor.main200,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          DateFormat("M월 d일")
                              .format(DateTime.parse(mySuggestItem.createdAt)),
                          style: EeatsTextStyle.body3(
                            color: EeatsColor.gray300,
                          ),
                        ),
                      ],
                    ),
                    EeatsGesture(
                      event: () => showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return MySuggestDialog(
                            title: mySuggestItem.title,
                            content: mySuggestItem.content,
                            uuid: mySuggestItem.id,
                          );
                        },
                      ),
                      child: SvgPicture.asset(
                          "$iconMyAsset/dots_vertical_icon.svg"),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  mySuggestItem.title,
                  style: EeatsTextStyle.body2(
                    color: EeatsColor.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  mySuggestItem.content,
                  style: EeatsTextStyle.body4(
                    color: EeatsColor.gray600,
                  ),
                ),
                const SizedBox(height: 12),
                if (mySuggestItem.comment != null)
                  Container(
                    decoration: BoxDecoration(
                      color: EeatsColor.main0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "$iconSuggestAsset/rightwards_arrow_icon.svg"),
                          const SizedBox(width: 4),
                          Text(
                            mySuggestItem.comment!.content,
                            style: EeatsTextStyle.body4(
                              color: EeatsColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
