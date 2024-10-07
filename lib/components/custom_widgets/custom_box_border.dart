

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomBoxBorder extends StatelessWidget {
  const CustomBoxBorder({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ConstantColor.white,
          border: Border.all(color: ConstantColor.greyEd),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
