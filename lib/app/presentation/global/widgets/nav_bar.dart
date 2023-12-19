import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/generated/assets.gen.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';

class NavBar extends HookConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.wd,
      height: 60,
      decoration: BoxDecoration(
        color: context.color.onPrimary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            spreadRadius: 5,
            color: context.color.shadow.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonIcon(onTap: () => {}, icon: Assets.iconsSolar.home.svg()),
            ButtonIcon(onTap: () => {}, icon: Assets.iconsSolar.library.svg()),
            ButtonIcon(onTap: () => {}, icon: Assets.iconsSolar.music.svg()),
          ]),
    );
  }
}
