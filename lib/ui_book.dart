import 'package:flutter/material.dart';
import 'package:ui_books/dialogs/dialogs.dart';
import 'package:ui_books/ui_audio.dart';
import 'package:ui_books/ui_home.dart';

import 'data_test/data_test.dart';
import 'item_card_box.dart';
import 'read_book.dart';
import 'res/borders/app_borders.dart';
import 'res/fonts/fonts.dart';
import 'widgets/border_button.dart';
import 'widgets/folder/tabbar_folder.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _ReadViewState();
}

class _ReadViewState extends State<BookPage> {
  int index = 0;

  void _goToReadBookPage() => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const ReadBookPage(),
        ),
      );

  void _goToAudioPage() => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const AudioPage(),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Const.paddingLeft, right: Const.paddingRight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Visibility(
                          visible: index == 0,
                          child: Expanded(
                            flex: 1,
                            child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: AppBorders.borderCardItem,
                                    border: const Border(
                                      top: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    )),
                                child: ClipRRect(
                                    borderRadius: AppBorders.borderCardItem,
                                    child: Image.asset(
                                      'assets/images/book.jpeg',
                                      fit: BoxFit.fill,
                                    ))),
                          ),
                        ),
                        10.w,
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TabbarFolder(
                                tabs: dataTestRead,
                                fct: (value) {
                                  setState(() {
                                    if (value.contains('Mô tả')) {
                                      index = 1;
                                    } else {
                                      index = 0;
                                    }
                                  });
                                },
                              ),
                              5.h,
                              Container(
                                  width: 500,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: AppBorders.borderCardItem,
                                      border: const Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      )),
                                  child: index == 0 ? _info() : _description()),
                            ],
                          ),
                        )
                      ],
                    ),
                    10.h,
                    _price(),
                    30.h,
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buttonBorder('Nghe truyện', _goToAudioPage),
                        _buttonBorder('Đọc truyện', _goToReadBookPage),
                        _buttonBorder('Audio VIP', _buyAudio),
                        _buttonBorder('Ủng hộ', _showDonateDialog),
                      ],
                    ),
                    30.h,
                    _otherBook(),
                  ],
                ),
              ),
            ),
            _comment(),
          ],
        ),
      ),
    );
  }

  void _buyAudio() {}

  void _showDonateDialog() {
    showDialog(
      context: context,
      builder: (context) => const DonateDialogView(),
    );
  }

  Widget _price() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: AppBorders.borderCardItem,
          gradient: AppBorders.browTree,
          border: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          )),
      child: Center(
        child: Text(
          'Giá: 350.000VND',
          style: Fonts.headerStyle.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  Widget _description() {
    return Text(
      '${Const.spaceHeadLine}${dataTestInfo['description']}'
          .replaceAll('.', '.\n${Const.spaceHeadLine}'),
      style: Fonts.textStyle.copyWith(height: 1.5),
      textAlign: TextAlign.start,
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dataTestInfo['name'] ?? '',
          style: Fonts.titleStyle.s16,
          textAlign: TextAlign.center,
        ),
        5.h,
        Row(
          children: [
            Text(
              'Tác giả: ',
              style: Fonts.titleStyle.s14,
            ),
            Text(
              ' ${dataTestInfo['author']}',
              style: Fonts.titleStyle.s14.copyWith(color: Colors.blue),
            ),
          ],
        ),
        5.h,
        Row(
          children: [
            Text(
              'Trạng thái: ',
              style: Fonts.titleStyle.s14,
            ),
            Text(
              '${dataTestInfo['status']}',
              style: Fonts.titleStyle.s14.copyWith(color: Colors.blue),
            ),
          ],
        ),
        5.h,
        Row(
          children: [
            Text(
              'Lượt xem: ',
              style: Fonts.titleStyle.s14,
            ),
            Text(
              '${dataTestInfo['view']}',
              style: Fonts.titleStyle.s14.copyWith(color: Colors.blue),
            ),
          ],
        ),
        5.h,
        Text(
          dataTestInfo['category'] ?? '',
          style: Fonts.titleStyle.s14,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _otherBook() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đề xuất',
          style: Fonts.headerStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              const ItemCardBoxView(),
              10.w,
              const ItemCardBoxView(),
              10.w,
              const ItemCardBoxView(),
              10.w,
              const ItemCardBoxView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonBorder(String title, Function fct) {
    return BorderButton(
      title: title,
      fct: fct,
      gradient: AppBorders.greyWhite,
    );
  }

  Widget _comment() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight, top: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppBorders.borderCardItem,
            border: const Border(
              top: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bình Luận:',
                style: Fonts.headerStyle,
              ),
              5.h,
              for (var item in dataTestComments.entries)
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.key,
                        style: Fonts.textStyle,
                      ),
                      Text(
                        item.value,
                        style: Fonts.textStyle.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              5.h,
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Bình luận',
                    suffixIcon: Icon(Icons.send),
                    border: OutlineInputBorder()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
