import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  final String? number;
  const HomeView({super.key, this.number});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // bottomNavigationBar: const NavBar(),
      body: SafeArea(
        child: Container(
            child: ListView(
          children: [
            Text("data $number"),
          ],
        )),
      ),
    );
  }
}
