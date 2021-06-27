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
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return ListView(
      children: [
        _header(),
      ],
    );
  }

  _header() {
    return Stack(
      children: [
        Positioned(
          top: -130,
          left: -130,
          child: Bubble(
            color: ColorTheme.secondaryColor,
            width: 300,
            height: 300,
          ),
        ),
        Positioned(
          top: 80,
          right: -50,
          child: Bubble(
            color: ColorTheme.secondaryColor,
            width: 100,
            height: 100,
          ),
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
            horizontal: SpaceConfig.longSpace,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hilangkan\nCovid-19",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Container(
                width: 210,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/image-fight-virus.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
