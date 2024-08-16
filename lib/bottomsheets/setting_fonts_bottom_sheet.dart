import 'package:flutter/material.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_home.dart';

import '../res/borders/app_borders.dart';
import '../res/colors/app_colors.dart';

class SettingFontBottomSheet extends StatefulWidget {
  const SettingFontBottomSheet({super.key});

  @override
  State<SettingFontBottomSheet> createState() => _SettingFontBottomSheetState();
}

class _SettingFontBottomSheetState extends State<SettingFontBottomSheet> {
  double slider = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Màu chữ:',
              style: Fonts.headerStyle,
            ),
            5.h,
            BroadSelectColor(
              fct: () {},
              listColor: AppColors.listColorText,
            ),
            10.h,
            Text(
              'Màu nền:',
              style: Fonts.headerStyle,
            ),
            5.h,
            BroadSelectColor(
              fct: () {},
              listColor: AppColors.listColorBGR,
            ),
            10.h,
            Text(
              'Cỡ chữ:',
              style: Fonts.headerStyle,
            ),
            5.h,
            Slider(
              max: 20,
              min: 10,
              divisions: 10,
              value: slider,
              onChanged: (value) {
                setState(() {
                  slider = value;
                });
              },
              label: '$slider',
            ),
          ],
        ),
      ),
    );
  }

  void _changeColorBRG() {}

  void _changeColorText() {}
}

class BroadSelectColor extends StatefulWidget {
  const BroadSelectColor({
    super.key,
    required this.fct,
    required this.listColor,
  });
  final List<Color> listColor;
  final Function fct;

  @override
  State<BroadSelectColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<BroadSelectColor> {
  int indexDefault = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 5, runSpacing: 5, children: [
      for (int i = 0; i < AppColors.listColorText.length; ++i) _buttonColor(i)
    ]);
  }

  Widget _buttonColor(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          indexDefault = index;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: widget.listColor[index],
            borderRadius: AppBorders.borderCardItem,
            border: Border(
              top: BorderSide(
                color: (indexDefault == index) ? Colors.green : Colors.black,
                width: 2,
              ),
              left: BorderSide(
                color: (indexDefault == index) ? Colors.green : Colors.black,
                width: 2,
              ),
              right: BorderSide(
                color: (indexDefault == index) ? Colors.green : Colors.black,
                width: 2,
              ),
            )),
        child: Visibility(
          visible: (indexDefault == index),
          child: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
