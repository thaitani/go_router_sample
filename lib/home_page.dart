import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        child: ListView.builder(
          primary: true,
          itemBuilder: (context, i) => ListTile(
            title: Text('Item $i'),
            onTap: () => context.push('/test'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('1'),
        onPressed: () => context.go('/2'),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({
    super.key,
    this.title,
    this.onPressed,
  });

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title ?? 'HomePage2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Text('2'),
      ),
    );
  }
}
