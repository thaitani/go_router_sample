import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/shell_router.dart';

import 'home_page.dart';

part 'router.g.dart';

final router = GoRouter(
  initialLocation: '/shell1',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: shellRoute,
    ),
    ...$appRoutes,
  ],
);

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<Home2Route>(
  path: '/2',
)
class Home2Route extends GoRouteData {
  const Home2Route();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage2();
  }
}
