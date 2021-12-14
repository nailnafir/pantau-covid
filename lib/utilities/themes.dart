part of 'utilities.dart';

abstract class ColorTheme {
  static Color bgLight = Color(0xFFF5F5F5);
  static Color bgDark = Color(0xFF251500);
  static Color primaryColor = Color(0xFFFFCE81);
  static Color secondaryColor = Color(0xFFFAB266);
  static Color tertiaryColor = Color(0xFFFDE3C8);
  static Color greenColor = Color(0xFF08AF80);
  static Color blueColor = Color(0xFF01ABE6);
  static Color redColor = Color(0xFFF65D5A);
  static Color accentColorDarkGrey = Color(0xFFADADAD);
  static Color accentColorLightGrey = Color(0xFFE3E3E3);
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

abstract class TypeTheme {
  static TextStyle titleTextFont = TextStyle(
    fontFamily: "Manrope",
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle subTitleTextFont = TextStyle(
    fontFamily: "Manrope",
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bigTextFont = TextStyle(
    fontFamily: "Manrope",
    fontSize: 16,
  );
  static TextStyle normalTextFont = TextStyle(
    fontFamily: "Manrope",
    fontSize: 14,
  );
  static TextStyle smallTextFont = TextStyle(
    fontFamily: "Manrope",
    fontSize: 12,
  );
}
