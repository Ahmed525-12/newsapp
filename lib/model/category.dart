import 'package:flutter/cupertino.dart';

class Category {
  String id;
  String title;
  String image;
  int color;
  Category(this.id, this.title, this.image, this.color);
  static List<Category> getCategory() {
    return [
      Category("sports", "Sport", "assets/sports.png", 0xffC91C22),
      Category("technology", "technology", "assets/science.png", 0xffF2D352),
      Category("business", "business", "assets/bussines.png", 0xffCF7E48),
      Category("entertainment", "entertainment", "assets/environment.png",
          0xff4882CF),
      Category("science", "science", "assets/science.png", 0xffF2D352),
      Category("general", "general", "assets/environment.png", 0xff4882CF),
      Category("health", "health", "assets/health.png", 0xffED1E79),
    ];
  }
}
