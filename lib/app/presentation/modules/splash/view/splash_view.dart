import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/generated/assets.gen.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        height: context.hg,
        width: context.wd,
        color: context.color.onBackground,
        child: Center(
          child: Assets.icons.logo.svg(
            width: context.wp(50),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
