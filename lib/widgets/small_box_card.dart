part of 'widgets.dart';

class SmallBoxCard extends StatelessWidget {
  final IconData icon;
  final String summary;
  final String cases;
  final Color color;

  const SmallBoxCard(
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
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(SpaceConfig.normalSpace),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
              color: color,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 6),
              child: Icon(
                icon,
                size: MediaQuery.of(context).size.width / 6 - 6,
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(SpaceConfig.normalSpace),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  summary,
                  style: TypeTheme.subTitleTextFont.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  cases,
                  style: TypeTheme.normalTextFont.copyWith(
                    color: Colors.white.withOpacity(0.75),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
