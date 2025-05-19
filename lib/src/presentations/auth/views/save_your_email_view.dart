import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/custom_buttom.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SaveYourEmailView extends StatelessWidget {
  const SaveYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.push('/addLogo');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Your invoices are\nsafe now!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF151515),
                fontSize: 21.sp,
                fontWeight: FontWeight.w600,
                height: 1.15,
              ),
            ),
            SizedBox(height: 1.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'All your invoices are now synced to your account ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                  TextSpan(
                    text: 'yourmail@example.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.43,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              'When you reinstal the app,\nremind yourself to log back in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.43,
              ),
            ),
            SizedBox(height: 2.h),
            CustomButtom(
              title: 'Continue',
              onTap: () {
                context.push('/addLogo');
              },
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
