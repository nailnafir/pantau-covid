part of 'widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  String greetings() {
    var hour = DateTime.now().hour;

    if (hour < 10) {
      return "Pagi";
    } else if (hour < 15) {
      return "Siang";
    } else if (hour < 18) {
      return "Sore";
    } else {
      return "Malam";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat ${greetings()},",
              style: TypeTheme.titleTextFont.copyWith(
                color: Colors.black.withOpacity(0.75),
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.notifications_outlined,
              color: Colors.black.withOpacity(0.75),
            )
          ],
        ),
        Text(
          "Selalu jaga kesehatan, ya!",
          style: TypeTheme.normalTextFont.copyWith(
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
