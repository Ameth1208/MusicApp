import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/generated/assets.gen.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';

class NavBar extends HookConsumerWidget {
  const NavBar({super.key, required this.onItemSelected});
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> items = [
      Assets.iconsSolar.home.svg(),
      Assets.iconsSolar.library.svg(),
      Assets.iconsSolar.music.svg(),
    ];

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
        children: items
            .asMap()
            .entries
            .map(
              (item) => ButtonIcon(
                icon: item.value,
                onTap: () => onItemSelected(item.key),
              ),
            )
            .toList(),
      ),
    );
  }
}
