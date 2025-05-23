import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final String? backgrounImage;
  final bool backgrounImageHave;
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Function()? onTap;

  const CustomScaffold({
    super.key,
    this.backgroundColor,
    required this.body,
    this.appBar,
    this.onTap,
    this.bottomNavigationBar,
    this.backgrounImage,
    this.backgrounImageHave = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        backgroundColor: backgroundColor ?? const Color(0xffF2F5F9),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  backgrounImageHave
                      ? DecorationImage(
                        image: AssetImage(
                          backgrounImage ?? 'assets/images/bg.png',
                        ),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
            child: SafeArea(bottom: false, child: body),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
