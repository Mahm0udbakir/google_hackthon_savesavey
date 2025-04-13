import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';

class AppSegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const AppSegmentButton(
      {super.key,
        required this.title,
        required this.onTap,
        required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: isActive
            ? BoxDecoration(
          color: ColorManager.gray60.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorManager.gray10.withValues(alpha: 0.3),
          ),
        )
            : BoxDecoration(),
        // fallback for inactive
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? ColorManager.white : ColorManager.gray30,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
