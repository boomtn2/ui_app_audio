import 'package:flutter/material.dart';

import 'package:ui_books/res/borders/app_borders.dart';
import 'package:ui_books/ui_home.dart';

import 'res/fonts/fonts.dart';
import 'ui_book.dart';

class ItemCardBoxView extends StatelessWidget {
  const ItemCardBoxView(
      {super.key,
      this.title = 'MANG THEO KHÔNG GIAN LÀM THANH NIÊN TRI THỨC (PHIÊN NGOẠI)',
      this.author = 'Ngô Tất Tố',
      this.img = 'assets/images/book.jpeg'});
  final String title;
  final String img;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookPage(),
              ));
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: AppBorders.borderCardItem,
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                  author
                      .toLowerCase()
                      .replaceRange(0, 1, author[0].toUpperCase()),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Fonts.titleStyle.copyWith(fontWeight: FontWeight.bold)),
            ),
            3.h,
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                  title
                      .toLowerCase()
                      .replaceRange(0, 1, title[0].toUpperCase()),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Fonts.titleStyle),
            )
          ],
        ),
      ),
    );
  }
}
