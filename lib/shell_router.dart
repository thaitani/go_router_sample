import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

part 'shell_router.g.dart';

final shellRoute = $appRoutes;

@TypedGoRoute<ShellHomeRoute>(
  path: '/shell1',
)
class ShellHomeRoute extends GoRouteData {
  const ShellHomeRoute();

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
class ShellHome2Route extends GoRouteData {
  const ShellHome2Route();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage2(
      title: 'Shell2',
    );
  }
}

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '記事',
          ),
        ],
        currentIndex: currentIndex(context),
        onTap: (index) => onItemTap(index, context),
      ),
    );
  }

  int currentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(const ShellHomeRoute().location)) {
      return 0;
    }
    if (location.startsWith(const ShellHome2Route().location)) {
      return 1;
    }
    return 0;
  }

  void onItemTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        const ShellHomeRoute().go(context);
        break;
      case 1:
        const ShellHome2Route().go(context);
        break;
      default:
        throw UnimplementedError();
    }
  }
}
