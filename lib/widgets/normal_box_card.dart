part of 'widgets.dart';

class NormalBoxCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const NormalBoxCard({
    Key? key,
    required this.imagePath,
    required this.title,
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
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              title,
              style: TypeTheme.subTitleTextFont.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorTheme.redColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
