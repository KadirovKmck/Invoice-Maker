import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final WidgetBuilder page; // указываем, какой экран открыть

  const MenuItem({required this.title, required this.page});
}
