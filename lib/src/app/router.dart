import 'package:go_router/go_router.dart';
import '../presentations/presentation.dart';

class RouterConst {
  static const String splash = 'splash';
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
    ],
  );
}
