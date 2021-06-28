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
                  top: 18,
                  right: 12,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
            vertical: SpaceConfig.normalSpace * 8.5,
          ),
          child: Text(
            "Bantuan\nUntukmu",
            style: TypeTheme.normalTextFont.copyWith(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
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
              SizedBox(height: SpaceConfig.longSpace),
              InkWell(
                splashColor: Colors.red,
                onTap: () {},
                child: ListCardTwoLines(
                  backgroundIconColor: ColorTheme.redColor,
                  tileColor: Colors.white,
                  title: "Pertanyaan Terkait",
                  subtitle: "Kumpulan pertanyaan",
                  icon: Icons.info,
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              InkWell(
                onTap: () async {
                  if (await canLaunch(URLShared.contactMeURL)) {
                    await launch(URLShared.contactMeURL);
                  } else {
                    throw 'Gagal menjalankan $URLShared.contactMeURL';
                  }
                },
                child: ListCardTwoLines(
                  backgroundIconColor: ColorTheme.greenColor,
                  tileColor: Colors.white,
                  title: "Hubungi Kami",
                  subtitle: "Tersedia Telegram dan Email",
                  icon: Icons.call,
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              InkWell(
                onTap: () {},
                child: ListCardTwoLines(
                  backgroundIconColor: ColorTheme.blueColor,
                  tileColor: Colors.white,
                  title: "Tentang Aplikasi",
                  subtitle: "Informasi terkait aplikasi",
                  icon: Icons.admin_panel_settings_outlined,
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
