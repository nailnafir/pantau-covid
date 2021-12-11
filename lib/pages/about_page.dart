part of 'pages.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Keterangan',
      'Data Covid-19',
      'Kabar Berita',
      'Kesehatan',
      'Bantuan Sosial',
      'Ilustrasi',
    ];

    List<String> subtitle = [
      'Aplikasi untuk memberikan informasi terkait COVID-19 di Indonesia dengan beberapa sumber data.',
      'covid19.go.id\nkemkes.go.id',
      'detik.com\nmerdeka.com',
      'halodoc.com\nalodokter.com',
      'kitabisa.com',
      'freepik.com\nlottiefiles.com',
    ];

    List<IconData> icon = [
      Icons.help,
      Icons.article,
      Icons.ballot,
      Icons.health_and_safety,
      Icons.card_giftcard,
      Icons.photo,
    ];

    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ColorTheme.secondaryColor,
        leading: Container(
          margin: EdgeInsets.only(left: SpaceConfig.normalSpace),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        title: Text(
          "Tentang Aplikasi",
          style: TypeTheme.titleTextFont.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned.fill(
                top: -25,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FadeInDown(
                    child: Container(
                      height: 300,
                      child: Lottie.asset(
                          'assets/images/illustration-developer.json'),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 220),
                child: Column(
                  children: List.generate(title.length, (index) {
                    return FadeInDown(
                      delay: Duration(milliseconds: 350 * (index + 2)),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: (index == 0) ? 0 : SpaceConfig.shortSpace / 2,
                          bottom: (index == title.length - 1)
                              ? 0
                              : SpaceConfig.shortSpace / 2,
                        ),
                        color: Colors.white,
                        child: ExpansionTile(
                          expandedCrossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          leading: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: SpaceConfig.normalSpace,
                              horizontal: SpaceConfig.normalSpace - 5,
                            ),
                            child: Icon(icon[index]),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                            vertical: SpaceConfig.shortSpace,
                            horizontal: SpaceConfig.longSpace,
                          ),
                          iconColor: Colors.black,
                          collapsedIconColor: ColorTheme.primaryColor,
                          title: Text(
                            title[index],
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          children: [
                            Text(
                              subtitle[index],
                              style: TypeTheme.normalTextFont.copyWith(
                                color: Colors.black.withOpacity(0.75),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          FadeInDown(
            delay: Duration(milliseconds: 350 * 8),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: SpaceConfig.longSpace),
              child: Text(
                "Versi 3.0.8\nHak Cipta @2020-${DateTime.now().year}. Nailul Firdaus",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
