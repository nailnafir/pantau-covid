part of 'widgets.dart';

class BigBoxCard extends StatelessWidget {
  final IconData icon;
  final String summary;
  final String update;
  final String cases;
  final Color color;
  final EdgeInsetsGeometry margin;
  final double iconSize;

  const BigBoxCard({
    Key? key,
    required this.icon,
    required this.summary,
    required this.update,
    required this.cases,
    required this.color,
    required this.margin,
    required this.iconSize,
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
              margin: margin,
              child: Icon(
                icon,
                size: iconSize,
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
                  update,
                  style: TypeTheme.normalTextFont.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summary,
                      style: TypeTheme.subTitleTextFont.copyWith(
                        color: Colors.white,
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
