import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/meal_type.dart';
import 'package:eeats/presentation/home/provider/home_meal_controller_cubit.dart';
import 'package:eeats/presentation/home/widget/home_meal_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "8월 27일 화요일",
                  style: EeatsTextStyle.subTitle1(
                    color: EeatsColor.black,
                  ),
                ),
                const SizedBox(height: 24),
                const HomeMealSwitch(),
                const SizedBox(height: 24),
              ],
            ),
          ),
          BlocBuilder<HomeMealControllerCubit, MealType>(
              builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 311,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: PageView.builder(
                      controller:
                          context.watch<HomeMealControllerCubit>().controller,
                      itemCount: MealType.values.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: EeatsColor.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: EeatsColor.main100,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(state.icon),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 43),
                                  child: SizedBox(
                                    height: 153,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  index == 100 - 1 ? 0 : 12),
                                          child: Text(
                                            "소보로 덮밥 & 소보로 덮밥 & 소보로 덮밥",
                                            textAlign: TextAlign.center,
                                            style: EeatsTextStyle.label1(
                                              color: EeatsColor.black,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "789.6Kal",
                                  style: EeatsTextStyle.caption3(
                                    color: EeatsColor.gray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: EeatsColor.main0,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "오늘 ${state.text}에서 나의 알레르기는?",
                            style: EeatsTextStyle.label3(
                              color: EeatsColor.gray400,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 11),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "소보로 덮밥",
                                        style: EeatsTextStyle.subTitle2(
                                          color: EeatsColor.main400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "에 ",
                                        style: EeatsTextStyle.subTitle2(
                                          color: EeatsColor.gray800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "조개류, 견과류",
                                        style: EeatsTextStyle.subTitle2(
                                          color: EeatsColor.main400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 알레르기 성분이 있어요.",
                                        style: EeatsTextStyle.subTitle2(
                                          color: EeatsColor.gray800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
