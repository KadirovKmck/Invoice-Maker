import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_maker/src/app/router.dart';
import 'package:invoice_maker/src/app/themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: GoogleFonts.poppins().fontFamily,
            extensions: [AppThemeColors.light],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.poppins().fontFamily,
            extensions: const [AppThemeColors.dark],
          ),
          routerConfig: RouterConf.goRouter,
        );
      },
    );
  }
}
