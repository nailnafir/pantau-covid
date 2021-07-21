part of 'widgets.dart';

class DetailBoxCard extends StatelessWidget {
  final String summaryPositive;
  final String updatePositive;
  final String summaryActive;
  final String updateActive;
  final String summaryRecovered;
  final String updateRecovered;
  final String summaryDeaths;
  final String updateDeaths;
  final String provinceName;
  final String lastUpdate;

  const DetailBoxCard({
    Key? key,
    required this.summaryPositive,
    required this.updatePositive,
    required this.summaryActive,
    required this.updateActive,
    required this.summaryRecovered,
    required this.updateRecovered,
    required this.summaryDeaths,
    required this.updateDeaths,
    required this.provinceName,
    required this.lastUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace - 4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
      child: Container(
        padding: EdgeInsets.all(SpaceConfig.normalSpace),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              provinceName,
              style: TypeTheme.normalTextFont
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              "Diperbarui: $lastUpdate",
              style: TypeTheme.normalTextFont
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            SizedBox(height: SpaceConfig.normalSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (Get.width -
                          2 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace) /
                      2,
                  padding: EdgeInsets.all(SpaceConfig.shortSpace),
                  decoration: BoxDecoration(
                      color: ColorTheme.secondaryColor,
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.shortSpace)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.add_circle_rounded,
                            size: Get.width / 6 - 6,
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+$updatePositive",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: SpaceConfig.shortSpace),
                          Text(
                            "$summaryPositive",
                            style: TypeTheme.subTitleTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Positif",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (Get.width -
                          2 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace) /
                      2,
                  padding: EdgeInsets.all(SpaceConfig.shortSpace),
                  decoration: BoxDecoration(
                      color: ColorTheme.blueColor,
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.shortSpace)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.remove_circle_rounded,
                            size: Get.width / 6 - 6,
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+$updateActive",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: SpaceConfig.shortSpace),
                          Text(
                            "$summaryActive",
                            style: TypeTheme.subTitleTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Dirawat",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SpaceConfig.shortSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (Get.width -
                          2 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace) /
                      2,
                  padding: EdgeInsets.all(SpaceConfig.shortSpace),
                  decoration: BoxDecoration(
                      color: ColorTheme.greenColor,
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.shortSpace)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.change_circle_rounded,
                            size: Get.width / 6 - 6,
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+$updateRecovered",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: SpaceConfig.shortSpace),
                          Text(
                            "$summaryRecovered",
                            style: TypeTheme.subTitleTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Sembuh",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (Get.width -
                          2 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace) /
                      2,
                  padding: EdgeInsets.all(SpaceConfig.shortSpace),
                  decoration: BoxDecoration(
                      color: ColorTheme.redColor,
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.shortSpace)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.cancel_rounded,
                            size: Get.width / 6 - 6,
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+$updateDeaths",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: SpaceConfig.shortSpace),
                          Text(
                            "$summaryDeaths",
                            style: TypeTheme.subTitleTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Meninggal",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
