import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/color_widget.dart';

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  final Color initialColor;
  final void Function(Color selectedColor)? onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.initialColor,
    this.onColorSelected,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late final ValueNotifier<Color> selectedColorNotifier;

  @override
  void initState() {
    selectedColorNotifier = ValueNotifier<Color>(widget.initialColor);

    super.initState();
  }

  @override
  void dispose() {
    selectedColorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: widget.colors.map(
        (color) {
          void onColorTapped() {
            selectedColorNotifier.value == color
                ? selectedColorNotifier.value = Color(0x00000000)
                : selectedColorNotifier.value = color;
            widget.onColorSelected?.call(selectedColorNotifier.value);
          }

          return ColorWidget(
            color: color,
            selectedColorNotifier: selectedColorNotifier,
            onTap: onColorTapped,
          );
        },
      ).toList(),
    );
  }
}
