import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router.dart';

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

  static final $navigatorKey = shellNavigatorKey;

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

@TypedGoRoute<ShellHome2Route>(path: '/shell2', routes: [
  TypedShellRoute<ShellInShellRoute>(routes: [
    TypedGoRoute<TestRoute>(path: TestRoute.path),
  ])
])
class ShellHome2Route extends GoShellRouteData {
  const ShellHome2Route();
  static final $navigatorKey = shellNavigatorKey;

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
    return HomePage2(
      title: path,
      onPressed: () => const TestRoute().go(context),
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
      appBar: AppBar(
        title: const Text('Shell'),
      ),
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
    final String location = GoRouterState.of(context).uri.toString();
    return shellRouteData.firstWhere((e) => location.startsWith(e.path)).index;
  }

  void _onItemTap(int index, BuildContext context) {
    final location = shellRouteData[index].path;
    context.go(location);
  }
}

final GlobalKey<NavigatorState> _shellInShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellInShell');

class ShellInShellRoute extends ShellRouteData {
  const ShellInShellRoute();

  static final $navigatorKey = _shellInShellNavigatorKey;
  static final $parentNavigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () => context.go('/shell2/test2?param=$index'),
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text('index $index'),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: navigator),
      ],
    );
  }
}

class TestRoute extends GoRouteData {
  const TestRoute({this.param});

  static const String path = 'test2';
  static final $parentNavigatorKey = _shellInShellNavigatorKey;
  final String? param;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage2(
      title: '${state.uri}',
      onPressed: () => context.go('/shell2'),
    );
  }
}
