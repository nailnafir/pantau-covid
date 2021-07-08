part of 'pages.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

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
                  height: 350,
                  color: ColorTheme.primaryColor,
                ),
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
                  top: 50,
                  right: -50,
                  child: Bubble(
                    color: ColorTheme.secondaryColor,
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 22,
                  child: Container(
                    width: 220,
                    height: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/image-help-center.png"),
                        fit: BoxFit.cover,
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
                  Text("PANTAU COVID",
                      style: TypeTheme.normalTextFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: SpaceConfig.normalSpace * 5),
              Text(
                "Bantuan\nUntukmu",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
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
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace - 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SpaceConfig.longSpace),
                InkWell(
                  onTap: () {
                    Get.to(FaqPage());
                  },
                  child: ListCardTwoLines(
                    backgroundIconColor: ColorTheme.redColor,
                    tileColor: Colors.white,
                    title: "Pertanyaan Terkait",
                    subtitle: "Kumpulan pertanyaan",
                    icon: Icons.question_answer,
                  ),
                ),
                SizedBox(height: SpaceConfig.normalSpace),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheet(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(SpaceConfig.longSpace)),
                        ),
                        onClosing: () {},
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SpaceConfig.longSpace),
                            color: ColorTheme.bgLight,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 50,
                                    height: 6,
                                    margin: EdgeInsets.symmetric(
                                        vertical: SpaceConfig.normalSpace),
                                    decoration: BoxDecoration(
                                      color: ColorTheme.secondaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunch("tel:119")) {
                                          await launch("tel:119");
                                        } else {
                                          throw Exception(
                                              'Gagal mengalihkan ke tujuan');
                                        }
                                      },
                                      child: ListCardOneLine(
                                        backgroundIconColor:
                                            ColorTheme.redColor,
                                        tileColor: Colors.white,
                                        title: "Kontak Darurat",
                                        icon: Icons.call,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunch(
                                            URLShared.telegramURL)) {
                                          await launch(URLShared.telegramURL);
                                        } else {
                                          throw Exception(
                                              'Gagal mengalihkan ke tujuan');
                                        }
                                      },
                                      child: ListCardOneLine(
                                        backgroundIconColor:
                                            ColorTheme.blueColor,
                                        tileColor: Colors.white,
                                        title: "Kontak Saya",
                                        icon: Icons.call,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: ListCardTwoLines(
                    backgroundIconColor: ColorTheme.greenColor,
                    tileColor: Colors.white,
                    title: "Hubungi Kami",
                    subtitle: "Bantuan lebih lanjut",
                    icon: Icons.call,
                  ),
                ),
                SizedBox(height: SpaceConfig.normalSpace),
                InkWell(
                  onTap: () {
                    Get.to(AboutPage());
                  },
                  child: ListCardTwoLines(
                    backgroundIconColor: ColorTheme.blueColor,
                    tileColor: Colors.white,
                    title: "Tentang Aplikasi",
                    subtitle: "Informasi terkait aplikasi",
                    icon: Icons.perm_device_info,
                  ),
                ),
                SizedBox(height: SpaceConfig.normalSpace),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
