import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color myColor;
  final void Function(Color) onColorChanged;

  const ColorPickerWidget(
      {super.key, required this.myColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color :"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Pick a Color"),
                        content: ColorPicker(
                            pickerColor: myColor,
                            onColorChanged: onColorChanged),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              print(myColor);
                            },
                            child: const Text("Save"),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Cancel"),
                          )
                        ],
                      );
                    });
              },
              child: const Text("Pick a Color"),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: myColor,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ],
    );
  }
}
