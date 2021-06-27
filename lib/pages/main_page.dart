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
        child: Column(
          children: [
            Expanded(
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return ListView(
      children: [
        _banner(),
        _content(),
      ],
    );
  }

  _banner() {
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

  _content() {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      padding: EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
      decoration: BoxDecoration(
        color: ColorTheme.bgLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SpaceConfig.longSpace),
          topRight: Radius.circular(SpaceConfig.longSpace),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: SpaceConfig.longSpace),
            child: ListCardTwoLines(
              backgroundIconColor: ColorTheme.secondaryColor,
              tileColor: ColorTheme.primaryColor.withOpacity(0.75),
              title: "Daftar Tes COVID-19",
              subtitle: "Pastikan kesehatan diri kamu",
              icon: Icons.add_box_outlined,
            ),
          ),
          Text(
            "Semua tentang COVID-19",
            style: TypeTheme.subTitleTextFont
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SpaceConfig.shortSpace),
          ListCardOneLine(
            backgroundIconColor: ColorTheme.blueColor,
            tileColor: Colors.white,
            title: "Kenali virus corona",
            icon: Icons.adjust,
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          ListCardOneLine(
            backgroundIconColor: ColorTheme.redColor,
            tileColor: Colors.white,
            title: "Gejala terinfeksi",
            icon: Icons.adjust,
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          ListCardOneLine(
            backgroundIconColor: ColorTheme.greenColor,
            tileColor: Colors.white,
            title: "Cara mencegah",
            icon: Icons.adjust,
          ),
        ],
      ),
    );
  }
}
