import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_home.dart';
import 'package:ui_books/widgets/border_button.dart';

class DonateDialogView extends StatelessWidget {
  const DonateDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ủng hộ truyện.',
            style: Fonts.headerStyle.s20,
          ),
          20.h,
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                hintText: 'Số Coin', border: OutlineInputBorder()),
          ),
          20.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BorderButton(
                title: 'Huỷ',
                fct: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
              ),
              10.h,
              BorderButton(
                title: 'Ủng hộ',
                fct: () {},
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
