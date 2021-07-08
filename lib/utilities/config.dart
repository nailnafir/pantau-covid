part of 'utilities.dart';

abstract class LayoutConfig {
  static double? deviceHeight;
  static double? deviceWidth;
  static MediaQueryData? mediaQueryData;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    deviceWidth = mediaQueryData!.size.width;
    deviceHeight = mediaQueryData!.size.height;
  }
}

abstract class SpaceConfig {
  static double shortSpace = 8;
  static double normalSpace = 12;
  static double longSpace = 24;
}
