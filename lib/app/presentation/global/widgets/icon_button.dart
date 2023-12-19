import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';

class ButtonIcon extends HookConsumerWidget {
  const ButtonIcon({
    super.key,
    this.onTap,
    this.color,
    this.icon,
  });
  final VoidCallback? onTap;
  final Widget? icon;

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.dp(1)),
        height: 50,
        width: 50,
        child: icon,
      ),
    );
  }
}
