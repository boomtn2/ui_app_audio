import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ui_books/data_test/data_test.dart';

import 'package:ui_books/res/borders/app_borders.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_search.dart';

import 'item_card_box.dart';
import 'widgets/folder/tabbar_folder.dart';

class Const {
  static const double paddingLeft = 20;
  static const double paddingRight = 20;
  static const double expandedItem = 35;
  static const TextStyle fontStyteLoadMore =
      TextStyle(color: Colors.blue, fontSize: 12);
  static const TextStyle fontStyteTitle =
      TextStyle(fontWeight: FontWeight.bold);
  static const String spaceHeadLine = '      ';
}

class UIHome extends StatelessWidget {
  const UIHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _itemAppBar(context),
        _space(),
        _title(),
        _itemNew(),
        _space(),
        _itemCategory(context),
        _space(),
        _itemWebsite(context),
        _space(),
        _itemListBook(context),
      ],
    );
  }

  Widget _title() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabbarFolder(
              tabs: dataTestNew,
              fct: (value) {},
            ),
            5.h,
          ],
        ),
      ),
    );
  }

  Widget _itemCategory(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabbarFolder(
              tabs: dataTestCategory,
              fct: (value) {},
            ),
            5.h,
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(5),
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
                  )),
              child: Column(
                children: [
                  Row(
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
                  10.h,
                  _buttonLoadmore(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemWebsite(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabbarFolder(
              tabs: dataTestWebsite,
              fct: (value) {},
            ),
            5.h,
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(5),
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
                  )),
              child: Column(
                children: [
                  Row(
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
                  5.h,
                  Row(
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
                  10.h,
                  _buttonLoadmore(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemListBook(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: AppBorders.borderCardItem,
                  border: const Border(
                    top: BorderSide(
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
                  )),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Tên truyện',
                        style: Fonts.headerStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Expanded(
                      flex: 1,
                      child: Text('Tác giả',
                          style: Fonts.headerStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  Expanded(
                      flex: 1,
                      child: Text('Lượt đọc',
                          style: Fonts.headerStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
            5.h,
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(5),
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
                  )),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    _buttonTitleBook(),
                    10.h,
                    _buttonLoadmore(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonLoadmore() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: AppBorders.borderCardItem,
          border: const Border(
              top: BorderSide(
            width: 2,
            color: Colors.red,
          ))),
      child: Text(
        'Xem thêm',
        style: Fonts.textButtonStyle.copyWith(fontSize: 14),
      ),
    );
  }

  Widget _buttonTitleBook() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  'MANG THEO KHÔNG GIAN LÀM THANH NIÊN TRI THỨC (PHIÊN NGOẠI)',
                  style: Fonts.titleStyle.copyWith(fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
            5.w,
            Expanded(
                flex: 1,
                child: Text('Ngô Tất tố',
                    style: Fonts.titleStyle.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis)),
            5.w,
            Expanded(
                flex: 1,
                child: Text('View',
                    style: Fonts.titleStyle.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis))
          ],
        ),
        2.h,
        const Divider()
      ],
    );
  }

  Widget _space() {
    return const SliverExpandedView(
      height: Const.expandedItem,
    );
  }

  Widget _itemNew() {
    return SliverToBoxAdapter(
        child: Container(
            margin: const EdgeInsets.only(
                left: Const.paddingLeft, right: Const.paddingRight),
            padding: const EdgeInsets.all(5),
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
                )),
            child: Column(
              children: [
                Row(
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
                5.h,
                Row(
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
                10.h,
                _buttonLoadmore(),
              ],
            )));
  }

  Widget _itemAppBar(BuildContext context) {
    return SliverAppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: Const.paddingLeft, right: Const.paddingRight),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SearchPage(),
                    ),
                  ),
                  child: const Icon(
                    Icons.menu,
                    size: 32,
                  ),
                ),
                12.w,
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            hintText: 'Tìm kiếm',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            suffixIcon: const Icon(Icons.search)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class TitleView extends StatelessWidget {
  const TitleView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.afacad(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class DetailBookInforView extends StatelessWidget {
  const DetailBookInforView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: const Color(0xFFE0E0DC),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/book.jpeg'),
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Thập niên 70...',
                maxLines: 1,
              ),
              Text(
                'Tác giả',
                maxLines: 1,
              ),
              Text(
                'Mô tả',
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SliverBannerView extends StatelessWidget {
  const SliverBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleView(
                  title: "Chọn lọc",
                ),
                Text(
                  'Xem thêm',
                  style: Const.fontStyteLoadMore,
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 120,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://i.ytimg.com/vi/KPssR-ReIds/hqdefault.jpg',
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: 10,
                viewportFraction: 0.6,
                scale: 0.8,
                autoplayDelay: 4000,
                autoplay: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverExpandedView extends StatelessWidget {
  const SliverExpandedView({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}

extension SizedBoxView on num {
  Widget get h => SizedBox(
        height: toDouble(),
      );
  Widget get w => SizedBox(
        width: toDouble(),
      );
}

class ImageBookView extends StatelessWidget {
  const ImageBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                    image: AssetImage('assets/images/book.jpeg'),
                    fit: BoxFit.fill)),
          ),
          Text(
            'Mang không gian xuyên 80, kiều phu hắn lại ngọt lại dã',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: GoogleFonts.afacad(
                fontSize: 10, height: 1, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
