import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';

class UpcomingBillsHomeList extends StatelessWidget {
  final Map billsObj;
  final VoidCallback onPressed;

  const UpcomingBillsHomeList({
    super.key,
    required this.billsObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        height: 64,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.border.withValues(alpha: 0.15),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ColorManager.gray70.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Jun",
                    style: TextStyle(
                        color: ColorManager.gray30,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),

                  Text(
                    "25",
                    style: TextStyle(
                        color: ColorManager.gray30,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                billsObj["name"],
                style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "\$${billsObj["price"]}",
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
