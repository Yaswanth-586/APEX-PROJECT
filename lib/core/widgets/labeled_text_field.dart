import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;

  const LabeledTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          validator: widget.validator,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                : widget.suffixIcon,
            counterText: '', // Hide character counter
          ),
        ),
      ],
    );
  }
}
