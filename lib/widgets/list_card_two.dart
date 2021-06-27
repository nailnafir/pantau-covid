part of 'widgets.dart';

class ListCardTwoLines extends StatelessWidget {
  final Color backgroundIconColor;
  final Color tileColor;
  final String title;
  final String? subtitle;
  final IconData icon;
  const ListCardTwoLines({
    Key? key,
    required this.backgroundIconColor,
    required this.tileColor,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpaceConfig.normalSpace),
      decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(SpaceConfig.normalSpace),
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
        subtitle: Text(
          subtitle!,
          style: TypeTheme.smallTextFont.copyWith(
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black.withOpacity(0.75),
        ),
      ),
    );
  }
}
