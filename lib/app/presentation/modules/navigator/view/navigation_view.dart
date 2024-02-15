import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';
import 'package:music_app/app/presentation/modules/modules.dart';

import '../controllers/navigator_provider.dart';

class NavigationView extends HookConsumerWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctl = ref.watch(navigatorProvider);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80), child: AppBarCustom()),
        body: Container(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: ctl.pageController,
            children: const [
              HomeView(
                number: "1",
              ),
              HomeView(
                number: "2",
              ),
              SongsView(),
            ],
          ),
        ),
        bottomNavigationBar: NavBar(
          onItemSelected: (i) => ctl.onPageView(i),
        ),
      ),
    );
  }
}
