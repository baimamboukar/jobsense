import 'package:flutter/material.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';

class JobsenseButton extends StatelessWidget {
  const JobsenseButton({
    required this.text,
    required this.color,
    this.action,
    super.key,
    this.width = .9,
    this.icon,
    this.textColor,
  });
  final Widget? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final Color? textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: context.width * width,
        height: 54,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              8.hGap,
            ] else
              const SizedBox.shrink(),
            Text(
              text,
              style: context.bodyLg.copyWith(
                color: textColor ?? context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobsenseButtonMedium extends StatelessWidget {
  const JobsenseButtonMedium({
    required this.text,
    required this.color,
    this.action,
    super.key,
    this.width = .35,
    this.icon,
  });
  final Widget? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return JobsenseButton(
      text: text,
      action: action,
      color: color,
      width: width,
      icon: icon,
    );
  }
}
