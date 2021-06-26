part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Text(
                  "Pantau Covid",
                  style: TypeTheme.titleTextFont,
                ),
              ],
            ),
            Container(
              width: LayoutConfig.deviceWidth,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
