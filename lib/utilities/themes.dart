part of 'utilities.dart';

abstract class ColorTheme {
  static Color bgLight = Color(0xFFE5E5E5);
  static Color bgDark = Color(0xFF251500);
  static Color primaryColor = Color(0xFFFFCE81);
  static Color secondaryColor = Color(0xFFFAB266);
  static Color greenColor = Color(0xFF08AF80);
  static Color blueColor = Color(0xFF01ABE6);
  static Color redColor = Color(0xFFF65D5A);
}

abstract class GradientTheme {
  static final backgroundColor = LinearGradient(
    colors: [
      Color(0xFFFFCE81),
      Color(0xFFFAB266),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

abstract class TextTheme {
  static TextStyle titleTextFont = TextStyle(
    fontFamily: "Raleway",
    fontSize: 20,
  );
  static TextStyle subTitleTextFont = TextStyle(
    fontFamily: "Raleway",
    fontSize: 18,
  );
  static TextStyle bigTextFont = TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
  );
  static TextStyle normalTextFont = TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
  );
  static TextStyle smallTextFont = TextStyle(
    fontFamily: "Poppins",
    fontSize: 12,
  );
}
