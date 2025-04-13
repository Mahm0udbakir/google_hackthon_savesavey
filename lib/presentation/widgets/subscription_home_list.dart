import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';

class SubscriptionHomeList extends StatelessWidget {
  final Map subsObj;
  final VoidCallback onPressed;

  const SubscriptionHomeList({
    super.key,
    required this.subsObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: ColorManager.gray60.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ColorManager.gray10.withValues(alpha: 0.3),
            ),
          ),
          // fallback for inactive
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  subsObj["icon"],
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    subsObj["name"],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "\$${subsObj["price"]}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
