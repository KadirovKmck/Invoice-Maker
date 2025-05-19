// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/components.dart';
import 'package:invoice_maker/src/presentations/busness/view/business_information.dart';
import 'package:invoice_maker/src/presentations/items/view/items_view.dart';
import 'package:invoice_maker/src/presentations/splash/model/menu_item.dart';
import 'package:invoice_maker/src/presentations/setting/view/personal_account.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Clients');
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Privacy');
}

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Terms');
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Contact');
}

class RateAppPage extends StatelessWidget {
  const RateAppPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Rate App');
}

class ShareAppPage extends StatelessWidget {
  const ShareAppPage({super.key});

  @override
  Widget build(BuildContext context) => _PlaceholderPage('Share App');
}

class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>
    with SingleTickerProviderStateMixin {
  final String _userName = 'Yulia Kartavenko';

  late final AnimationController _controller;

  late final List<MenuItem> _items = [
    MenuItem(title: 'Personal Account', page: (_) => const PersonalAccount()),
    MenuItem(
      title: 'Business Information',
      page: (_) => const BusinessInformation(),
    ),
    MenuItem(title: 'Clients', page: (_) => const ClientsPage()),
    MenuItem(title: 'Items', page: (_) => const ItemsView()),
    MenuItem(title: 'Privacy', page: (_) => const PrivacyPage()),
    MenuItem(title: 'Terms', page: (_) => const TermsPage()),
    MenuItem(title: 'Contact', page: (_) => const ContactPage()),
    MenuItem(title: 'Rate App', page: (_) => const RateAppPage()),
    MenuItem(title: 'Share App', page: (_) => const ShareAppPage()),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
              SizedBox(height: 1.h),
              // Аватар
              ScaleTransition(
                scale: Tween<double>(begin: .5, end: 1).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: const Interval(0, .3, curve: Curves.elasticOut),
                  ),
                ),
                child: Container(
                  width: 17.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _userName[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              // Имя
              FadeTransition(
                opacity: CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(.2, .4, curve: Curves.easeOut),
                ),
                child: Text(
                  _userName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              // Список
              FadeTransition(
                opacity: CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(.25, 1, curve: Curves.easeOut),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: List.generate(_items.length, (index) {
                        final item = _items[index];
                        final start = 0.30 + index * 0.06;
                        final end = start + 0.25;

                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final t =
                                (_controller.value - start) / (end - start);
                            final eased = Curves.easeOut.transform(
                              t.clamp(0.0, 1.0),
                            );
                            return Opacity(
                              opacity: eased,
                              child: Transform.translate(
                                offset: Offset(12.w * (1 - eased), 0),
                                child: child,
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(0),
                                  onTap:
                                      () => Navigator.of(context).push(
                                        MaterialPageRoute(builder: item.page),
                                      ),
                                  splashColor: Colors.grey.withOpacity(.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 2.h,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (index != _items.length - 1)
                                Divider(
                                  height: 0,
                                  thickness: .45,
                                  indent: 4.w,
                                  endIndent: 4.w,
                                  color: Colors.grey.shade300,
                                ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}
