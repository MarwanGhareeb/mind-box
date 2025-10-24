import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  final void Function(Color selectedColor)? onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    this.onColorSelected,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: widget.colors.map(
        (color) {
          bool isSelected = selectedColor == color;

          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedColor = color;
                });
                if (widget.onColorSelected != null) {
                  widget.onColorSelected!(color);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: 4,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
