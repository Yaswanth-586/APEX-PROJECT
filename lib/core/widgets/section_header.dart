import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final bool showArrow;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.showArrow = false,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          if (trailing != null) trailing!,
          if (showArrow && onTap != null)
            IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                size: 20,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                padding: const EdgeInsets.all(4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
