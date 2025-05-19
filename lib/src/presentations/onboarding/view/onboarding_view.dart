import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List images = <String>[
    'assets/images/on1.png',
    'assets/images/on2.png',
    'assets/images/on3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
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
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/onboarding_container_bg.png',
                  ),
                  fit: BoxFit.fill,
                ),
                color: const Color(0xFF07FB1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[0]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Welcome to Receipts',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF151515),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
            SizedBox(height: 2.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Create professional invoices in seconds.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' Perfect for freelancers, small businesses, and anyone who values their time.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),
            CustomButtom(title: 'Continue'),
          ],
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final String title;
  const CustomButtom({
    super.key,
    this.width,
    this.height,
    this.decoration,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
