import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/presentations/setting/view/setting_view.dart';
import '../presentations/presentation.dart';

class RouterConst {
  static const String splash = 'splash';
  static const String setting = 'setting';
}

class RouterConf {
  static final GoRouter goRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: RouterConst.splash,
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: RouterConst.setting,
        path: '/setting',
        builder: (context, state) =>  SettingView(),
      ),
    ],
  );
}
