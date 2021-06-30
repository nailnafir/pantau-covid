part of 'widgets.dart';

class ListCardOneLine extends StatelessWidget {
  final Color backgroundIconColor;
  final Color tileColor;
  final String title;
  final IconData icon;
  const ListCardOneLine({
    Key? key,
    required this.backgroundIconColor,
    required this.tileColor,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpaceConfig.normalSpace,
          vertical: SpaceConfig.shortSpace,
        ),
        decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(SpaceConfig.shortSpace),
            decoration: BoxDecoration(
              color: backgroundIconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          title: Text(
            title,
            style: TypeTheme.bigTextFont.copyWith(
              color: Colors.black.withOpacity(0.75),
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}
