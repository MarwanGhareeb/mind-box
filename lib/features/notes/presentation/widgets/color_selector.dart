import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorSelector extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;

  const ColorSelector({
    super.key,
    required this.initialColor,
    required this.onColorChanged,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color pickerColor;

  @override
  void initState() {
    super.initState();
    pickerColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ColorPicker(
        pickerColor: pickerColor,
        onColorChanged: (Color value) {
          setState(() {
            pickerColor = value;
            widget.onColorChanged.call(pickerColor);
          });
        },
        pickerAreaHeightPercent: 0.8,
        displayThumbColor: true,
        paletteType: PaletteType.hsv,
        enableAlpha: true,
        colorPickerWidth: 250,
      ),
    );
  }
}
