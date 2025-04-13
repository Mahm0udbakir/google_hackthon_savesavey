import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';

class CategoryContainer extends StatelessWidget {
  final String categoryIcon;
  final String categoryLabel;
  final double moneyLeftToSpend;
  final double moneySpent;
  final double categoryBudget;
  final String progressBarColor;

  const CategoryContainer(
      {super.key,
      required this.categoryIcon,
      required this.categoryLabel,
      required this.moneyLeftToSpend,
      required this.moneySpent,
      required this.categoryBudget,
      required this.progressBarColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      width: 340,
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.gray60,
          ),
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.gray70.withValues(alpha: 0.4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      categoryIcon,
                      width: 35,
                      height: 35,
                      color: ColorManager.gray30,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryLabel,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$$moneyLeftToSpend left to spend',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.gray30),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$$moneySpent',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'of \$$categoryBudget',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.gray30),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(progressBarColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
