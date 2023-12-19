import 'package:flutter/material.dart';
import 'package:music_app/app/generated/assets.gen.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wd,
      decoration: BoxDecoration(
        color: context.color.onPrimary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            spreadRadius: 5,
            color: context.color.shadow.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: context.wp(2.5)),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonIcon(icon: Assets.iconsSolar.menu.svg()),
          ButtonIcon(onTap: () => {}, icon: Assets.iconsSolar.magnifer.svg()),
        ],
      ),
    );
  }
}
