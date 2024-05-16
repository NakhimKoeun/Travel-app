class Page {
  final String images;
  final String title;
  final String subtitle;

  Page({required this.images, required this.title, required this.subtitle});
}

class View {
  final String images;
  final String title;
  final String city;
  final String province;
  View(
      {required this.images,
      required this.title,
      required this.city,
      required this.province});
}

class Explore {
  final String images;
  final String text;
  Explore({required this.images, required this.text});
}
