import 'package:auto_route/auto_route.dart';
import 'package:jobsense/app/router/guards/auth_guard.dart';
import 'package:jobsense/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: Welcome.page,
      path: '/welcome',
    ),
    AutoRoute(
      page: Homepage.page,
      path: '/jobsense-home',
      guards: [AuthGuard()],
      initial: true,
    ),
    AutoRoute(
      page: JobDescriptionRoute.page,
      path: '/jobsense-job-description',
    ),
    AutoRoute(
      page: AlertsRoute.page,
      path: '/jobsense-notifications',
    ),
    AutoRoute(
      page: AuthenticationRoute.page,
      path: '/jobsense-auth',
    ),
    AutoRoute(
      page: UserProfileRoute.page,
      path: '/user-profile',
    ),
  ];
}
