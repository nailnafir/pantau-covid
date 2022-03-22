part of 'widgets.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  const ShimmerLoading({
    Key? key,
    required this.width,
    required this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
          color: ColorTheme.bgLight,
        ),
      ),
    );
  }
}
