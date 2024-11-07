import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/meal_type.dart';
import 'package:eeats/presentation/home/widget/home_meal_switch.dart';
import 'package:eeats/presentation/home/widget/home_meal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: MealType.values.length, vsync: this);
    _controller.animation!.addListener(() {
      int index = _controller.index + _controller.offset.round();

      setState(() {
        _controller.index = index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                HomeMealSwitch(controller: _controller),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 311,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TabBarView(
                      controller: _controller,
                      children: MealType.values
                          .map((type) => HomeMealWidget(type: type))
                          .toList()),
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
                          "오늘 ${MealType.values.elementAt(_controller.index).text}에서 나의 알레르기는?",
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
          ),
        ],
      ),
    );
  }
}
