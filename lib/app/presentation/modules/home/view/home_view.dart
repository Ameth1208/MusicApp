import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';

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
            Text("data $number",
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.color.scrim)),
          ],
        )),
      ),
    );
  }
}
