import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/custom_buttom.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/on1.png',
      'title': 'Welcome to Receipts',
      'desc1': 'Create professional invoices in seconds.',
      'desc2':
          'Perfect for freelancers, small businesses, and anyone who values their time.',
    },
    {
      'image': 'assets/images/on2.png',
      'title': 'Full control over your invoices',
      'desc1': 'Generate, edit, and send invoices from your phone.',
      'desc2':
          'Keep track of your history, monitor payments, and automate your workflow.',
    },
    {
      'image': 'assets/images/on3.png',
      'title': 'Simple and intuitive',
      'desc1': 'User-friendly interface with flexible settings.',
      'desc2': 'Work easily — anywhere, anytime.',
    },
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.push('/auth');
    }
  }

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
                  context.push('/auth');
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
            SizedBox(height: 2.h),
            SizedBox(
              height: 70.h,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: pages.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final page = pages[index];
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        width: double.infinity,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/onboarding_container_bg.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 80.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(page['image']!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF151515),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${page['desc1']} ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                            TextSpan(
                              text: page['desc2'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 4.h),
            CustomButtom(title: 'Continue', onTap: _nextPage),
          ],
        ),
      ),
    );
  }
}
