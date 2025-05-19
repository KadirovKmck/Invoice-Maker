import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButtom extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final String title;
  final Function()? onTap;
  const CustomButtom({
    super.key,
    this.width,
    this.height,
    this.decoration,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: height ?? double.infinity,
        height: height ?? 7.h,
        decoration:
            decoration ??
            ShapeDecoration(
              color: const Color(0xFF45BB50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
