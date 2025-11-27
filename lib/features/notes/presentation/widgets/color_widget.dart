import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  final ValueNotifier<Color> selectedColorNotifier;
  final void Function() onTap;

  const ColorWidget({
    super.key,
    required this.color,
    required this.selectedColorNotifier,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: ValueListenableBuilder<Color>(
          valueListenable: selectedColorNotifier,
          builder: (_, selectedColor, __) {
            final bool isSelected = selectedColor == color;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.white : const Color(0x00000000),
                  width: 3.5,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
