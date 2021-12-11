part of 'widgets.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  late Future<String> _name;

  @override
  void initState() {
    super.initState();
    _name = _pref.then((SharedPreferences pref) {
      return pref.getString("name") ?? "";
    });
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
            FutureBuilder<String>(
                future: _name,
                builder: (context, snapshot) {
                  return Text(
                    "${greetings()} ${snapshot.data},",
                    style: TypeTheme.titleTextFont.copyWith(
                      color: Colors.black.withOpacity(0.75),
                    ),
                  );
                }),
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
