import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(
      () => setState(
        () => _isFocused = _focusNode.hasFocus,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: _isFocused ? AppColors.textOnLight : AppColors.textOnDark,
          ),
      keyboardType: widget.keyboardType,
      minLines: widget.keyboardType == TextInputType.multiline ? 5 : null,
      maxLines: widget.keyboardType == TextInputType.multiline ? null : 1,
      decoration: _decoration(),
      validator: _validator,
      cursorColor: AppColors.overlayDark,
      cursorErrorColor: AppColors.overlayDark,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      hintText: widget.hintText,
      fillColor: _isFocused
          ? AppColors.whiteWithAlpha(0.4)
          : AppColors.whiteWithAlpha(0.2),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
