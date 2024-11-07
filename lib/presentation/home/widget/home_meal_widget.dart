import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/type/meal_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMealWidget extends StatelessWidget {
  final MealType type;

  const HomeMealWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
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
            SvgPicture.asset(type.icon),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43),
              child: SizedBox(
                height: 153,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: index == 100 - 1 ? 0 : 12),
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
  }
}
