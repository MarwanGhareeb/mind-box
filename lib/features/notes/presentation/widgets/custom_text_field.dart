import 'package:flutter/material.dart';

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
      keyboardType: widget.keyboardType,
      minLines: widget.keyboardType == TextInputType.multiline ? 5 : null,
      maxLines: widget.keyboardType == TextInputType.multiline ? null : 1,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 17),
      decoration: _decoration(),
      validator: _validator,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 16),
      hintText: widget.hintText,
      hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(13),
      ),
      filled: true,
      fillColor: _isFocused
          ? Colors.white.withValues(alpha: 0.4)
          : Colors.white.withValues(alpha: 0.2),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
