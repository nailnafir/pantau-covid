part of 'widgets.dart';

class NormalBoxCard extends StatelessWidget {
  final Widget iconImage;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const NormalBoxCard({
    Key? key,
    required this.iconImage,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
      elevation: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(SpaceConfig.normalSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconImage,
            Text(
              title,
              style: TypeTheme.subTitleTextFont.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
