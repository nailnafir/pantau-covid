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
            Bubble(
              color: ColorTheme.secondaryColor,
              width: 300,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: SpaceConfig.longSpace,
                vertical: SpaceConfig.shortSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("PANTAU COVID",
                      style: TypeTheme.normalTextFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: SpaceConfig.longSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kami\nMau Sehat",
                    style: TypeTheme.titleTextFont.copyWith(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/image-virus.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
