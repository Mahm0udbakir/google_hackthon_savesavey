import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const SubscriptionCell(
      {super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.border.withValues(alpha: 0.1),
          ),
          color: ColorManager.gray60.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.asset(
              sObj["icon"],
              width: 45,
              height: 45,
            ),
            const Spacer(),
            Text(
              sObj["name"],
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}