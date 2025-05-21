import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContainersWidgets extends StatelessWidget {
  const ContainersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 🎯 Прозрачный градиент снизу
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.4),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🌟 Кнопка Create Invoice
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 6.5.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Create Invoice',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 2.h),

          // 🌿 Кнопка Create Estimates
          SizedBox(
            width: double.infinity,
            height: 6.5.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Create Estimates',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
