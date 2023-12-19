import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';
import 'package:music_app/app/presentation/modules/home/home.dart';

class NavigationView extends HookConsumerWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80), child: AppBarCustom()),
        body: Container(
          child: PageView(children: const [
            HomeView(),
            HomeView(),
          ]),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
