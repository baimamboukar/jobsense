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

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.text,
    super.key,
    this.color,
    this.width = .9,
    this.textColor,
    this.withBorder,
    this.borderColor,
    this.borderWidth,
    this.height,
  });
  final String text;
  final Color? color;
  final double width;
  final double? height;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 283, maxHeight: 45),
        width: context.width * width,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          border: (withBorder ?? false) == true
              ? Border.all(
                  color: borderColor ?? context.colorScheme.primary,
                  width: borderWidth ?? 1,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                backgroundColor: context.colorScheme.onPrimary,
              ),
            ),
            8.hGap,
            Text(
              text,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                color: textColor ??
                    (color == context.colorScheme.onPrimary
                        ? context.colorScheme.primary
                        : context.colorScheme.onPrimary),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
