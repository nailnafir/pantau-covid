part of 'widgets.dart';

class Bubble extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const Bubble(
      {Key? key,
      required this.color,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
