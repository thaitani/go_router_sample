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
}

RouteBase get $shellHome2Route => GoRouteData.$route(
      path: '/shell2',
      factory: $ShellHome2RouteExtension._fromState,
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
}
