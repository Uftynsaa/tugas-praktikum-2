import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigasi/models/item.dart';
import 'package:navigasi/pages/home_page.dart';
import 'package:navigasi/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

/// ROUTER
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        final item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
      ),
    );
  }
}