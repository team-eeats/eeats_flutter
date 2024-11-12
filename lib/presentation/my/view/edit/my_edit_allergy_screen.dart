import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/component/eeats_outlined_button.dart';
import 'package:eeats/core/component/eeats_text_field.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/dummy/allergy_list.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/app_bar_type.dart';
import 'package:eeats/presentation/my/cubit/select_allergy_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEditAllergyScreen extends StatefulWidget {
  const MyEditAllergyScreen({super.key});

  @override
  State<MyEditAllergyScreen> createState() => _MyEditAllergyScreenState();
}

class _MyEditAllergyScreenState extends State<MyEditAllergyScreen> {

  @override
  Widget build(BuildContext context) {
    final allergyList = context.watch<SelectAllergyCubit>().state;
    return EeatsLayout(
      appBar: const EeatsAppBar(type: AppBarType.pop),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: EeatsOutlinedButton(
        backgroundColor: EeatsColor.main500,
        event: () {},
        content: Text(
          "수정하기",
          style: EeatsTextStyle.button2(
            color: EeatsColor.white,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "갖고있는\n알레르기를 선택해주세요!",
                style: EeatsTextStyle.heading3(
                  color: EeatsColor.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "알레르기 식품이 급식일 경우 알림을 드릴게요.",
                style: EeatsTextStyle.body3(
                  color: EeatsColor.gray400,
                ),
              ),
              const SizedBox(height: 36),
              Wrap(
                direction: Axis.horizontal,
                // 나열 방향
                alignment: WrapAlignment.start,
                // 정렬 방식
                spacing: 14,
                // 좌우 간격
                runSpacing: 14,
                // 상하 간격
                children: [
                  for (int i = 0; i < allergyData.length; i++)
                    FittedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: EeatsColor.main300,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            allergyData.values.elementAt(i),
                            style: EeatsTextStyle.label2(
                              color: EeatsColor.white,
                            ),
                          ),
                        ),
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
