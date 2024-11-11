import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SuggestItemWidget extends StatelessWidget {
  final int index;

  const SuggestItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestBloc, SuggestState<SuggestListEntity>>(
      builder: (context, state) {
        final suggestItem = state.value.suggestions![index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: suggestItem.comment != null ? EeatsColor.main200 : EeatsColor.gray50,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      suggestItem.accountId,
                      style: EeatsTextStyle.body3(
                        color: EeatsColor.main200,
                      ),
                    ),
                    Text(
                      DateFormat("M월 d일").format(DateTime.parse(suggestItem.createdAt)),
                      style: EeatsTextStyle.body4(
                        color: EeatsColor.gray300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  suggestItem.title,
                  style: EeatsTextStyle.body2(
                    color: EeatsColor.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  suggestItem.content,
                  style: EeatsTextStyle.body4(
                    color: EeatsColor.gray600,
                  ),
                ),
                const SizedBox(height: 12),
                if (suggestItem.comment != null)
                  Container(
                    decoration: BoxDecoration(
                      color: EeatsColor.main0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          SvgPicture.asset("$iconSuggestAsset/rightwards_arrow_icon.svg"),
                          const SizedBox(width: 4),
                          Text(
                            suggestItem.comment!.content,
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
