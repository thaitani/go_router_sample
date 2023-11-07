// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $shellHomeRoute,
      $shellHome2Route,
    ];

RouteBase get $shellHomeRoute => GoRouteData.$route(
      path: '/shell1',
      factory: $ShellHomeRouteExtension._fromState,
    );

extension $ShellHomeRouteExtension on ShellHomeRoute {
  static ShellHomeRoute _fromState(GoRouterState state) =>
      const ShellHomeRoute();

  String get location => GoRouteData.$location(
        '/shell1',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellHome2Route => GoRouteData.$route(
      path: '/shell2',
      factory: $ShellHome2RouteExtension._fromState,
      routes: [
        ShellRouteData.$route(
          navigatorKey: ShellInShellRoute.$navigatorKey,
          parentNavigatorKey: ShellInShellRoute.$parentNavigatorKey,
          factory: $ShellInShellRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'test2',
              parentNavigatorKey: TestRoute.$parentNavigatorKey,
              factory: $TestRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ShellHome2RouteExtension on ShellHome2Route {
  static ShellHome2Route _fromState(GoRouterState state) =>
      const ShellHome2Route();

  String get location => GoRouteData.$location(
        '/shell2',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShellInShellRouteExtension on ShellInShellRoute {
  static ShellInShellRoute _fromState(GoRouterState state) =>
      const ShellInShellRoute();
}

extension $TestRouteExtension on TestRoute {
  static TestRoute _fromState(GoRouterState state) => TestRoute(
        param: state.uri.queryParameters['param'],
      );

  String get location => GoRouteData.$location(
        '/shell2/test2',
        queryParams: {
          if (param != null) 'param': param,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
