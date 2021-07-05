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
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Container(
          //     margin: EdgeInsets.all(SpaceConfig.normalSpace),
          //     child: CircularPercentIndicator(
          //       radius: MediaQuery.of(context).size.width / 6 -
          //           SpaceConfig.normalSpace -
          //           8,
          //       percent: percent,
          //       animation: true,
          //       animationDuration: 1200,
          //       backgroundColor: ColorTheme.bgLight,
          //       circularStrokeCap: CircularStrokeCap.round,
          //       lineWidth: 6.0,
          //       center: Text(
          //         update + "%",
          //         style: TypeTheme.smallTextFont.copyWith(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
                  cases,
                  style: TypeTheme.normalTextFont.copyWith(
                    color: Colors.white.withOpacity(0.75),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      summary,
                      style: TypeTheme.subTitleTextFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        height: 2.2,
                      ),
                    ),
                    Text(
                      update + "%",
                      style: TypeTheme.normalTextFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 2.2,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SpaceConfig.normalSpace),
                  child: LinearPercentIndicator(
                    lineHeight: SpaceConfig.normalSpace,
                    backgroundColor: Colors.black.withAlpha(50),
                    progressColor: Colors.white,
                    percent: percent,
                    animation: true,
                    animationDuration: 1200,
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
