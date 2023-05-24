import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

part 'shell_router.g.dart';

final shellRoute = $appRoutes;

abstract class GoShellRouteData extends GoRouteData {
  const GoShellRouteData();

  String get label;
  String get path;
  IconData get icon;
  int get index;
}

@TypedGoRoute<ShellHomeRoute>(
  path: '/shell1',
)
class ShellHomeRoute extends GoShellRouteData {
  const ShellHomeRoute();

  @override
  String get label => 'ホーム';
  @override
  String get path => '/shell1';
  @override
  IconData get icon => Icons.home;
  @override
  int get index => 0;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage(
      title: 'Shell1',
    );
  }
}

@TypedGoRoute<ShellHome2Route>(
  path: '/shell2',
)
class ShellHome2Route extends GoShellRouteData {
  const ShellHome2Route();

  @override
  String get label => '記事';
  @override
  IconData get icon => Icons.business;
  @override
  String get path => '/shell2';
  @override
  int get index => 1;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage2(
      title: 'Shell2',
    );
  }
}

const shellRouteData = [
  ShellHomeRoute(),
  ShellHome2Route(),
];

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: shellRouteData
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.icon),
                label: e.label,
              ),
            )
            .toList(),
        currentIndex: _currentIndex(context),
        onTap: (index) => _onItemTap(index, context),
      ),
    );
  }

  int _currentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    return shellRouteData.firstWhere((e) => location.startsWith(e.path)).index;
  }

  void _onItemTap(int index, BuildContext context) {
    final location = shellRouteData[index].path;
    context.go(location);
  }
}
