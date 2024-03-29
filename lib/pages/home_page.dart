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
      backgroundColor: ColorTheme.bgLight,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  color: ColorTheme.primaryColor,
                ),
                Positioned(
                  top: -130,
                  left: -130,
                  child: FadeInLeft(
                    child: Bubble(
                      color: ColorTheme.secondaryColor,
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: -50,
                  child: FadeInRight(
                    child: Bubble(
                      color: ColorTheme.secondaryColor,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 22,
                  child: FadeInRight(
                    delay: Duration(milliseconds: 350 * 2),
                    child: Container(
                      width: 220,
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/image-fight-virus.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                _buildBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _banner(),
        _content(),
      ],
    );
  }

  _banner() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
            vertical: SpaceConfig.normalSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(
                    delay: Duration(milliseconds: 350),
                    child: Row(
                      children: [
                        Icon(
                          Icons.coronavirus_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text("PANTAU COVID-19",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  FadeInRight(
                    delay: Duration(milliseconds: 350),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(height: SpaceConfig.normalSpace * 5),
              FadeInLeft(
                delay: Duration(milliseconds: 350 * 2),
                child: Text(
                  "Lawan\nVirus",
                  style: TypeTheme.titleTextFont.copyWith(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace * 5),
            ],
          ),
        ),
      ],
    );
  }

  _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
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
                height: (MediaQuery.of(context).size.height +
                            MediaQuery.of(context).size.width) /
                        10 +
                    4,
                margin: EdgeInsets.symmetric(
                  vertical: SpaceConfig.longSpace,
                  horizontal: SpaceConfig.longSpace - 4,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: SpaceConfig.shortSpace,
                  mainAxisSpacing: SpaceConfig.shortSpace,
                  primary: false,
                  childAspectRatio: 1.58,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            'https://alodokter.com/cari-rumah-sakit/kedokteran-umum/swab-antigen')) {
                          await launch(
                            'https://alodokter.com/cari-rumah-sakit/kedokteran-umum/swab-antigen',
                            enableJavaScript: true,
                            forceWebView: true,
                            enableDomStorage: true,
                          );
                        } else {
                          throw Exception('Tidak dapat mengalihkan ke tujuan');
                        }
                      },
                      child: NormalBoxCard(
                        iconImage: Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/icon-swab.png")),
                          ),
                        ),
                        title: "Swab Test",
                        backgroundColor: ColorTheme.blueColor,
                        textColor: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            'https://covid19.go.id/faskesvaksin/')) {
                          await launch(
                            'https://covid19.go.id/faskesvaksin/',
                            enableJavaScript: true,
                            forceWebView: true,
                            enableDomStorage: true,
                          );
                        } else {
                          throw Exception('Tidak dapat mengalihkan ke tujuan');
                        }
                      },
                      child: NormalBoxCard(
                        iconImage: Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/icon-syringe.png")),
                          ),
                        ),
                        title: "Vaksinasi",
                        backgroundColor: ColorTheme.greenColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                child: Text(
                  "Semua Tentang COVID-19",
                  style: TypeTheme.subTitleTextFont,
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace - 4,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/definition");
                      },
                      child: ListCardOneLine(
                        backgroundIconColor: ColorTheme.blueColor,
                        tileColor: Colors.white,
                        title: "Kenali virus corona",
                        icon: Icons.adjust,
                      ),
                    ),
                    SizedBox(height: SpaceConfig.shortSpace),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/symptom");
                      },
                      child: ListCardOneLine(
                        backgroundIconColor: ColorTheme.redColor,
                        tileColor: Colors.white,
                        title: "Gejala terinfeksi",
                        icon: Icons.people_outline,
                      ),
                    ),
                    SizedBox(height: SpaceConfig.shortSpace),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/prevention");
                      },
                      child: ListCardOneLine(
                        backgroundIconColor: ColorTheme.greenColor,
                        tileColor: Colors.white,
                        title: "Cara mencegah",
                        icon: Icons.admin_panel_settings_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
            ],
          ),
        ),
      ],
    );
  }
}
