import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_home.dart';
import 'package:ui_books/widgets/border_button.dart';

import 'res/borders/app_borders.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  bool isPlay = false;

  void _play() {
    setState(() {
      isPlay = !isPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.download,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: Const.paddingLeft, right: Const.paddingRight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _detailView(),
              20.h,
              _playStateView(),
              20.h,
              Row(
                children: [
                  Text(
                    'Danh sách tập:',
                    style: Fonts.headerStyle,
                  ),
                ],
              ),
              5.h,
              _listChapterView(),
              5.h,
              _pickNumberPageChapter(),
              10.h,
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          children: [
            _iconButton(Icons.report, Colors.red, 'Báo lỗi'),
            _iconButton(Icons.download, Colors.blue, 'Tải'),
            _iconButton(Icons.bookmark, null, 'Xem sau'),
          ],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _pickNumberPageChapter() {
    return Row(
      children: [
        for (int i = 0; i < 5; ++i)
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: BorderButton(
              title: '  $i  ',
              fct: () {},
              color: i == 0 ? Colors.blue : Colors.black,
            ),
          )
      ],
    );
  }

  void _showStoreDialog(BuildContext context) {}

  void _showReportDialog(BuildContext context) {}

  Widget _button(String title, Function fct) {
    return BorderButton(title: title, fct: fct);
  }

  Widget _listChapterView() {
    return Expanded(
      child: ListView(
        children: [for (int i = 0; i < 10; ++i) _itemChapter('Chương $i')],
      ),
    );
  }

  Widget _itemChapter(String title) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: AppBorders.borderCardItem,
        border: const Border(
          top: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: Text(
        title,
        style: Fonts.titleStyle.s14,
      ),
    );
  }

  Widget _detailView() {
    return Column(
      children: [
        Text(
          'Mang không gian xuyên 80, kiều phu hắn lại ngọt lại dã',
          style: Fonts.headerStyle,
          textAlign: TextAlign.center,
        ),
        5.h,
        SizedBox(
          height: 150,
          child: ClipRRect(
            borderRadius: AppBorders.borderCardItem,
            child: Image.asset('assets/images/avt.jpg'),
          ),
        ),
        5.h,
        Text(
          'Chương 1',
          style: Fonts.textStyle.s16,
        ),
      ],
    );
  }

  SpeedDialChild _iconButton(IconData icon, Color? color, String title) {
    return SpeedDialChild(
      label: title,
      child: Icon(
        icon,
        //  size: 42,
        color: color,
      ),
    );
  }

  Widget _playStateView() {
    return Column(
      children: [
        Slider(
          value: 0,
          onChanged: (value) {},
          max: 100,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: AppBorders.borderCardItem,
            border: const Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.skip_previous_rounded,
                size: 62,
              ),
              InkWell(
                onTap: _play,
                child: isPlay
                    ? const Icon(
                        Icons.play_arrow_rounded,
                        size: 62,
                      )
                    : const Icon(
                        Icons.pause_rounded,
                        size: 62,
                      ),
              ),
              const Icon(
                Icons.skip_next_rounded,
                size: 62,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showChapterDialog() {}
}
