part of 'widgets.dart';

class DetailBoxCard extends StatelessWidget {
  final IconData icon;
  final String summaryPositive;
  final String updatePositive;
  final String summaryActive;
  final String updateActive;
  final String summaryRecovered;
  final String updateRecovered;
  final String summaryDeaths;
  final String updateDeaths;
  final Color color;

  const DetailBoxCard({
    Key? key,
    required this.icon,
    required this.summaryPositive,
    required this.updatePositive,
    required this.summaryActive,
    required this.updateActive,
    required this.summaryRecovered,
    required this.updateRecovered,
    required this.summaryDeaths,
    required this.updateDeaths,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height / 3 - SpaceConfig.longSpace + 2,
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace - 4),
        crossAxisSpacing: SpaceConfig.shortSpace,
        mainAxisSpacing: SpaceConfig.shortSpace,
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        primary: false,
        children: [
          BigBoxCard(
            icon: Icons.add_circle_rounded,
            summary: summaryPositive,
            update: updatePositive,
            cases: "Positif",
            color: ColorTheme.secondaryColor,
          ),
          BigBoxCard(
            icon: Icons.remove_circle_rounded,
            summary: summaryActive,
            update: updateActive,
            cases: "Dirawat",
            color: ColorTheme.blueColor,
          ),
          BigBoxCard(
            icon: Icons.change_circle_rounded,
            summary: summaryRecovered,
            update: updateRecovered,
            cases: "Sembuh",
            color: ColorTheme.greenColor,
          ),
          BigBoxCard(
            icon: Icons.cancel_rounded,
            summary: summaryDeaths,
            update: updateDeaths,
            cases: "Meninggal",
            color: ColorTheme.redColor,
          ),
        ],
      ),
    );
  }
}
