part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        Stack(
          children: [
            _banner(),
            _content(),
          ],
        )
      ],
    );
  }

  _banner() {
    return Stack(
      children: [
        Positioned(
          top: -150,
          left: -150,
          child: Bubble(
            color: ColorTheme.secondaryColor,
            width: 300,
            height: 300,
          ),
        ),
        Positioned(
          top: 70,
          right: -50,
          child: Bubble(
            color: ColorTheme.secondaryColor,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          top: -20,
          right: 24,
          child: Container(
            width: 220,
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image-fight-virus.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
            vertical: SpaceConfig.normalSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              SizedBox(height: 40),
              Text(
                "Hilangkan\nCovid-19",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ],
    );
  }

  _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 3.7),
        Container(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height / 2.62),
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
                icon: Icons.people_outline,
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              ListCardOneLine(
                backgroundIconColor: ColorTheme.greenColor,
                tileColor: Colors.white,
                title: "Cara mencegah",
                icon: Icons.admin_panel_settings_outlined,
              ),
              SizedBox(height: SpaceConfig.longSpace),
            ],
          ),
        ),
      ],
    );
  }
}
