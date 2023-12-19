import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // bottomNavigationBar: const NavBar(),
      body: SafeArea(
        child: Container(
            child: ListView(
          children: const [],
        )),
      ),
    );
  }
}
