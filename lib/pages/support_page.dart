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
                              AssetImage("assets/images/image-help-center.png"),
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
                  ),
                ],
              ),
              SizedBox(height: SpaceConfig.normalSpace * 5),
              FadeInLeft(
                delay: Duration(milliseconds: 350 * 2),
                child: Text(
                  "Bantuan\nUntukmu",
                  style: TypeTheme.normalTextFont.copyWith(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w700,
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
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace - 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SpaceConfig.longSpace),
                FadeInDown(
                  delay: Duration(milliseconds: 350 * 3),
                  child: InkWell(
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
                ),
                SizedBox(height: SpaceConfig.normalSpace),
                FadeInDown(
                  delay: Duration(milliseconds: 350 * 4),
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        BottomSheet(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(SpaceConfig.longSpace)),
                          ),
                          onClosing: () {},
                          enableDrag: false,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SpaceConfig.longSpace),
                              color: ColorTheme.bgLight,
                              height: 240,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 50,
                                          height: 6,
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SpaceConfig.normalSpace),
                                          decoration: BoxDecoration(
                                            color: ColorTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: SpaceConfig.normalSpace),
                                  FadeInUp(
                                    delay: Duration(milliseconds: 350),
                                    child: InkWell(
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
                                  ),
                                  SizedBox(height: SpaceConfig.normalSpace),
                                  FadeInUp(
                                    delay: Duration(milliseconds: 350 * 2),
                                    child: InkWell(
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
                ),
                SizedBox(height: SpaceConfig.normalSpace),
                FadeInDown(
                  delay: Duration(milliseconds: 350 * 5),
                  child: InkWell(
                    onTap: () {
                      Get.to(AboutPage());
                    },
                    child: ListCardTwoLines(
                      backgroundIconColor: ColorTheme.blueColor,
                      tileColor: Colors.white,
                      title: "Tentang Aplikasi",
                      subtitle: "Informasi aplikasi",
                      icon: Icons.perm_device_info,
                    ),
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
