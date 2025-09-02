import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final double size;

  const AppBackButton({
    super.key,
    this.onPressed,
    this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.pop(),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: color ?? Theme.of(context).iconTheme.color,
        size: size,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: color ?? Theme.of(context).iconTheme.color,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
