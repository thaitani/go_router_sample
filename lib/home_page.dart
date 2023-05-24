import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/shell_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title ?? 'HomePage'),
            ElevatedButton(
              onPressed: () => const ShellHomeRoute().go(context),
              child: const Text('shell1'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () => context.go('/2'),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title ?? 'HomePage2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
      ),
    );
  }
}
