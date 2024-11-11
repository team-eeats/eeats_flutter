import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/type/meal_type.dart';
import 'package:eeats/domain/entity/meal/meal_entity.dart';
import 'package:eeats/presentation/home/bloc/home_bloc.dart';
import 'package:eeats/presentation/home/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMealWidget extends StatefulWidget {
  final MealType type;

  const HomeMealWidget({
    super.key,
    required this.type,
  });

  @override
  State<HomeMealWidget> createState() => _HomeMealWidgetState();
}

class _HomeMealWidgetState extends State<HomeMealWidget> {
  List<String> _formatMeals(String meals) {
    return meals.split(',').map((meal) {
      return meal.replaceAll(RegExp(r'\s*\(\d[\d,.]*\)\s*'), '').trim();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState<MealEntity>>(
      builder: (context, state) {
        List<String>? meals = switch (widget.type) {
          MealType.breakfast => state.value.breakfast,
          MealType.lunch => state.value.lunch,
          MealType.dinner => state.value.dinner,
        };
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
            child: switch (state.state) {
              HomeRemoteState.initial => Center(
                  child: Text(
                    "인터넷 연결을 확인해주세요.",
                    textAlign: TextAlign.center,
                    style: EeatsTextStyle.label1(
                      color: EeatsColor.gray800,
                    ),
                  ),
                ),
              HomeRemoteState.failure => Center(
                  child: Text(
                    "인터넷 연결을 확인해주세요.",
                    textAlign: TextAlign.center,
                    style: EeatsTextStyle.label1(
                      color: EeatsColor.gray800,
                    ),
                  ),
                ),
              HomeRemoteState.loading =>
                const Center(child: CupertinoActivityIndicator()),
              HomeRemoteState.success => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(widget.type.icon),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 43),
                        child: SizedBox(
                          height: 153,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _formatMeals(meals![0]).length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index ==
                                              _formatMeals(meals[0]).length - 1
                                          ? 0
                                          : 12),
                                  child: Text(
                                    _formatMeals(meals[0]).elementAt(index),
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
                      ),
                      const SizedBox(height: 20),
                      Text(
                        meals.length > 1 ? meals[1] : "",
                        style: EeatsTextStyle.caption3(
                          color: EeatsColor.gray400,
                        ),
                      ),
                    ],
                  ),
                ),
            });
      },
    );
  }
}
