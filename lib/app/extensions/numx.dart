import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension OmnisenseNumExtensions on num {
  SizedBox get vGap => SizedBox(height: toDouble());
  SizedBox get hGap => SizedBox(width: toDouble());
  String get formattedNumber => NumberFormat().format(this);
  String get currencyFormat => this >= 1000
      ? "${NumberFormat.compactCurrency(
          locale: 'en',
          symbol: r'$',
        ).format(this / 1000)}K"
      : NumberFormat.currency(locale: 'en', symbol: r'$').format(this);
}
