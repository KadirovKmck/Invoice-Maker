import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _timer = Timer(const Duration(seconds: 3), () {
        if (mounted && context.mounted) {
          context.go('/home');
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgrounImageHave: true,
      backgrounImage: 'assets/images/bg.png',
      body: Column(),
    );
  }
}
