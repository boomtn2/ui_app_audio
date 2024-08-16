import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_books/item_card_box.dart';
import 'package:ui_books/res/fonts/fonts.dart';
import 'package:ui_books/ui_home.dart';

import 'res/borders/app_borders.dart';
import 'widgets/seach_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isTypeSearchName = true;

  void _changeTye(bool isNameSearch) {
    setState(() {
      isTypeSearchName = isNameSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _space20View(),
            _searchView(),
            _space10View(),
            _categorySearchView(),
            _space10View(),
            _websiteView(),
            _resultView('Youtube'),
            _space10View(),
            _resultView('Wiki'),
            _space10View(),
            _resultView('Dtruyen'),
            _space10View(),
            _resultView('HoTruyen'),
          ],
        ),
      ),
    );
  }

  Widget _categorySearchView() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Thể loại',
                  style: Fonts.headerStyle,
                ),
                Checkbox(
                    value: !isTypeSearchName,
                    onChanged: (value) => _changeTye(!(value ?? false))),
              ],
            ),
            Visibility(
              visible: !isTypeSearchName,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Ngôn tình'),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Điền văn'),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Nữ cường'),
                          ],
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Không gian'),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Hệ thống'),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _checkBox('Huyền học'),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _space10View() {
    return SliverToBoxAdapter(
      child: 10.h,
    );
  }

  Widget _space20View() {
    return SliverToBoxAdapter(
      child: 20.h,
    );
  }

  Widget _searchView() {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.only(
          left: Const.paddingLeft, right: Const.paddingRight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Tên/Tác giả',
                style: Fonts.headerStyle,
              ),
              Checkbox(
                  value: isTypeSearchName,
                  onChanged: (value) => _changeTye(value ?? false)),
            ],
          ),
          Visibility(
              visible: isTypeSearchName, child: const SearchTextFieldView()),
        ],
      ),
    ));
  }

  Widget _websiteView() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _checkBox('Youtube'),
          _checkBox('Wiki'),
          _checkBox('Dtruyen'),
          _checkBox('HoTruyen'),
        ],
      ),
    );
  }

  Widget _checkBox(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Fonts.titleStyle,
        ),
        Checkbox(
          value: false,
          onChanged: (value) {},
        )
      ],
    );
  }

  Widget _resultView(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Const.paddingLeft, right: Const.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Fonts.headerStyle,
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
          ],
        ),
      ),
    );
  }
}
