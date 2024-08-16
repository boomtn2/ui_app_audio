import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ui_books/data_test/data_test.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_home.dart';

import 'bottomsheets/setting_fonts_bottom_sheet.dart';

class ReadBookPage extends StatelessWidget {
  const ReadBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(context),
            _title(),
            _body(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            )
          ],
        ),
        floatingActionButton: SpeedDial(
          children: [
            SpeedDialChild(
              label: 'Phông chữ',
              child: const Icon(Icons.settings),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => const SettingFontBottomSheet(),
              ),
            ),
            SpeedDialChild(
                label: 'Tập tiếp theo',
                child: const Icon(
                  Icons.skip_next,
                  color: Colors.red,
                )),
            SpeedDialChild(
                label: 'Tải về',
                child: const Icon(
                  Icons.download,
                  color: Colors.blue,
                )),
            SpeedDialChild(
                label: 'Theo dõi', child: const Icon(Icons.bookmark)),
          ],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      actions: [],
    );
  }

  Widget _title() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Center(
          child: Text(
            'Chương 1:',
            style: Fonts.headerStyle.copyWith(height: 1.5),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Text(
          '${Const.spaceHeadLine}${dataTestChapter['1']}'
              .replaceAll('.', '.\n${Const.spaceHeadLine}'),
          style: Fonts.textStyle.copyWith(height: 1.5),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
