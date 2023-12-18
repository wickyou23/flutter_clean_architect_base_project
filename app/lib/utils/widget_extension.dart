import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget onTap(void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
