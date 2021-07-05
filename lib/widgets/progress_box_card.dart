part of 'widgets.dart';

class ProgressBoxCard extends StatelessWidget {
  final IconData icon;
  final String summary;
  final String update;
  final String cases;
  final double percent;
  final Color color;

  const ProgressBoxCard({
    Key? key,
    required this.icon,
    required this.summary,
    required this.update,
    required this.cases,
    required this.percent,
    required this.color,
  }) : super(key: key);

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
                size: MediaQuery.of(context).size.width / 4 - 6,
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
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width / 2 -
                      2 * SpaceConfig.longSpace,
                  lineHeight: SpaceConfig.normalSpace + SpaceConfig.shortSpace,
                  backgroundColor: Colors.black.withAlpha(50),
                  progressColor: ColorTheme.redColor,
                  percent: percent,
                  animation: true,
                  animationDuration: 1200,
                  center: Text(
                    update + "%",
                    style: TypeTheme.normalTextFont.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summary,
                      style: TypeTheme.subTitleTextFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        height: 0.5,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
