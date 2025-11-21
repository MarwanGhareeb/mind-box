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
  Color selectedColor = const Color(0x00000000);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: widget.colors.map(
        (color) {
          bool isSelected = selectedColor == color;

          void onColorTapped() {
            setState(() {
              selectedColor = color;
            });
            if (widget.onColorSelected != null) {
              widget.onColorSelected!(color);
            }
          }

          return Expanded(
            child: InkWell(
              onTap: onColorTapped,
              child: _customAnimatedContainer(
                color: color,
                isSelected: isSelected,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  AnimatedContainer _customAnimatedContainer({
    required Color color,
    required bool isSelected,
  }) {
    return AnimatedContainer(
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
    );
  }
}
