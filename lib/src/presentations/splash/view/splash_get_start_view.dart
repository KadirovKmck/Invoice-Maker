import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/components.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashGetStartView extends StatelessWidget {
  const SplashGetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgrounImageHave: true,
      backgrounImage: 'assets/images/splash_get_bg.png',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Invoice \nMarker',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                height: 0.90,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Create Proffesional Invoices in Second . \nGet and Started with Your Free Trial',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.w300,
                height: 1.4,
              ),
            ),
            SizedBox(height: 13.h),
            GestureDetector(
              onTap: () {
                context.push('/onboarding');
              },
              child: Container(
                width: double.infinity,
                height: 7.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
