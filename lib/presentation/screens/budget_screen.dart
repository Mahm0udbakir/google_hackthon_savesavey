import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/category_container.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Spending & Budgets',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.gray30,
                  fontSize: 16,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 22),
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage(
                        'assets/images/halfCircle.png',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      Text(
                        '\$225,62',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'of \$1,950 budget',
                        style: TextStyle(
                            color: ColorManager.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CategoryContainer(
                categoryIcon: 'assets/images/carIcon.png',
                categoryLabel: 'Auto & Transport',
                moneyLeftToSpend: 375,
                moneySpent: 25,
                categoryBudget: 400,
                progressBarColor: 'assets/images/ProgressBarGreen.png'),
            const SizedBox(
              height: 10,
            ),
            CategoryContainer(
                categoryIcon: 'assets/images/chatBotIcon.png',
                categoryLabel: 'Entertainment',
                moneyLeftToSpend: 550.99,
                moneySpent: 50.02,
                categoryBudget: 600,
                progressBarColor: 'assets/images/progressBarSecondary.png'),
            const SizedBox(
              height: 10,
            ),
            CategoryContainer(
                categoryIcon: 'assets/images/securityIcon.png',
                categoryLabel: 'Security',
                moneyLeftToSpend: 800.99,
                moneySpent: 150.60,
                categoryBudget: 950,
                progressBarColor: 'assets/images/progressBarPurple.png'),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){},
              child: DottedBorder(
                dashPattern: [3,4],
                borderType: BorderType.RRect,
                radius: Radius.circular(16),
                color: ColorManager.gray60,
                child: Container(
                  alignment: Alignment.center,
                  height: 90,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add new category',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorManager.gray30,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Icon(
                        Icons.add_circle_outline,
                        size: 19,
                        color: ColorManager.gray30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
