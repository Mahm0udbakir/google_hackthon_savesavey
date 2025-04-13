import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final String value;
  final Color statusColor;


  const StatusButton(
      {super.key,
        required this.title,
        required this.value,
        required this.statusColor,
     });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 68,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.border.withValues(alpha: 0.15),
            ),
            color: ColorManager.gray60.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: ColorManager.gray40,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 1,
          color: statusColor,
        ),
      ],
    );
  }
}