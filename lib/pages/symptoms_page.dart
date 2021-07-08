part of 'pages.dart';

class SymptompsPage extends StatelessWidget {
  const SymptompsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ColorTheme.primaryColor,
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
          "Gejala COVID-19",
          style: TypeTheme.titleTextFont.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: ColorTheme.primaryColor,
              height: 350,
            ),
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
              top: 50,
              right: -50,
              child: Bubble(
                color: ColorTheme.secondaryColor,
                width: 100,
                height: 100,
              ),
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return ListView(
      children: [
        _description(),
        _content(),
      ],
    );
  }

  _description() {
    return Container(
        padding: EdgeInsets.all(SpaceConfig.longSpace),
        child: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Apa kamu merasa sakit?",
                  style: TypeTheme.subTitleTextFont.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: SpaceConfig.shortSpace),
                Text(
                  "Masing-masing orang memiliki respons yang berbeda terhadap COVID-19. Sebagian besar orang yang terpapar virus ini akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa perlu dirawat di rumah sakit.",
                  style: TypeTheme.normalTextFont.copyWith(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: SpaceConfig.longSpace),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace)),
                      elevation: 2,
                      primary: ColorTheme.redColor,
                    ),
                    onPressed: () async {
                      if (await canLaunch(
                          "https://covid19.go.id/pelaporan-mandiri")) {
                        await launch(
                          "https://covid19.go.id/pelaporan-mandiri",
                          enableDomStorage: true,
                          enableJavaScript: true,
                          forceWebView: true,
                        );
                      } else {
                        throw Exception("Gagal mengalihkan ke telepon");
                      }
                    },
                    child: Text("Lapor Mandiri",
                        style: TypeTheme.subTitleTextFont),
                  ),
                ),
                SizedBox(height: SpaceConfig.normalSpace),
              ],
            );
          },
        ));
  }

  _content() {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.bgLight,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(SpaceConfig.longSpace)),
      ),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: SpaceConfig.longSpace),
                height: MediaQuery.of(context).size.height / 2.2,
                child: GridView.count(
                  padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  crossAxisCount: 2,
                  crossAxisSpacing: SpaceConfig.shortSpace,
                  mainAxisSpacing: SpaceConfig.shortSpace,
                  childAspectRatio: 1.0,
                  primary: false,
                  children: [
                    NormalBoxCard(
                      imagePath: 'assets/images/symptomp_headache.png',
                      title: 'Sakit Kepala',
                    ),
                    NormalBoxCard(
                      imagePath: 'assets/images/symptomp_cough.png',
                      title: 'Batuk',
                    ),
                    NormalBoxCard(
                      imagePath: 'assets/images/symptomp_fever.png',
                      title: 'Demam',
                    ),
                    NormalBoxCard(
                      imagePath: 'assets/images/symptomp_pain.png',
                      title: 'Nyeri Otot',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
