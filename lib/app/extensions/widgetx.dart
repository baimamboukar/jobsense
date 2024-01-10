import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Padding get vPadding => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: this,
      );
  Padding get hPadding => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: this,
      );
}