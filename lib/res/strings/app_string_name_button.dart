class AppStringNameButton {
  static final NameButton nameButton = NameButton.vn();
  static final String loadMore = nameButton.loadMore;
}

class NameButton {
  final String loadMore;
  final String search;
  NameButton({required this.loadMore, required this.search});

  factory NameButton.vn() =>
      NameButton(loadMore: 'Xem thêm', search: 'Tìm kiếm');

  factory NameButton.en() =>
      NameButton(loadMore: 'Load more', search: 'Search');
}
