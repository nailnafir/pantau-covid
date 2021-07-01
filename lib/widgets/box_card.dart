part of 'widgets.dart';

class BoxCard extends StatelessWidget {
  final IconData icon;
  final String summary;
  final String cases;
  final Color color;

  const BoxCard(
      {Key? key,
      required this.icon,
      required this.summary,
      required this.cases,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
      elevation: 2,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(SpaceConfig.normalSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(0.75),
            ),
            Text(
              summary,
              style: TypeTheme.subTitleTextFont.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              cases,
              style: TypeTheme.smallTextFont.copyWith(
                color: Colors.white.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
