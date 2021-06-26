part of 'utilities.dart';

abstract class LayoutConfig {
  static double? deviceHeight;
  static double? deviceWidth;

  void init(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
  }
}

abstract class SpaceConfig {
  static double shortSpace = 8;
  static double normalSpace = 12;
  static double longSpace = 24;
}
