
import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    super.key, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondaryText3 : AppColors.secondaryText2,
        borderRadius: BorderRadius.circular(8.0)
      ),
    );
  }
}