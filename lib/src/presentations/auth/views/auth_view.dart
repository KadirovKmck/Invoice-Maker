import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/custom_buttom.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final email = TextEditingController();
  final phone = TextEditingController();
  final adress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const hintGrey = Color(0xFFB4B4B4);
    const dividerGrey = Color(0xFFE5E5E5);

    TextStyle labelStyle(BuildContext ctx) => TextStyle(
      color: const Color(0xFF151515),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: 1.3,
    );

    InputDecoration decoration() => InputDecoration(
      isCollapsed: true,
      hintText: 'Optional',
      hintStyle: TextStyle(
        color: hintGrey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
    );

    Widget field(
      String label, {
      TextInputType? type,
      TextEditingController? controller,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: labelStyle(context)),
              SizedBox(width: 4.w),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: type,
                  style: labelStyle(context),
                  decoration: decoration(),
                  cursorColor: const Color(0xFF007AFF),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.8.h),
          Container(height: 1, color: dividerGrey),
          SizedBox(height: 1.8.h),
        ],
      );
    }

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
                  if (email.text.isEmpty ||
                      phone.text.isEmpty ||
                      adress.text.isEmpty) {
                  } else {
                    context.push('/saveEmail');
                  }
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
            Text(
              'Tell Us About \nYour Business',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF151515),
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'It will appear on invoice',
              style: TextStyle(
                color: const Color(0xFF8E8E93),
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  field(
                    'E-mail',
                    type: TextInputType.emailAddress,
                    controller: email,
                  ),
                  field('Phone', type: TextInputType.phone, controller: phone),
                  Row(
                    children: [
                      Text('Address', style: labelStyle(context)),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: TextField(
                          controller: adress,
                          style: labelStyle(context),
                          decoration: decoration(),
                          cursorColor: const Color(0xFF007AFF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            CustomButtom(
              title: 'Continue',
              onTap: () {
                if (email.text.isEmpty ||
                    phone.text.isEmpty ||
                    adress.text.isEmpty) {
                } else {
                  context.push('/saveEmail');
                }
              },
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
