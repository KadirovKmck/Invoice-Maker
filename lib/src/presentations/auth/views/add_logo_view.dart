import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/components.dart';
import 'package:invoice_maker/src/components/custom_buttom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddLogoView extends StatelessWidget {
  const AddLogoView({super.key});

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
                  context.push('/home');
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
            SizedBox(height: 1.h),
            Text(
              'Do You Have a Logo?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF151515),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                height: 1.15,
              ),
            ),
            Text(
              'It will appear on invoice',
              style: TextStyle(
                color: const Color(0xFF8E8E93),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.57,
              ),
            ),
            SizedBox(height: 3.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 13.h,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/svg/add_logo.svg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Spacer(),
            CustomButtom(
              title: 'Continue',
              onTap: () {
                context.push('/home');
              },
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
