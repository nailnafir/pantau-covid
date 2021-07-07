part of 'pages.dart';

class SymptompsPage extends StatelessWidget {
  const SymptompsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "Gejala COVID-19",
          style: TypeTheme.titleTextFont.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              color: ColorTheme.secondaryColor,
              margin: EdgeInsets.all(SpaceConfig.longSpace),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
              ),
              elevation: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(SpaceConfig.normalSpace),
                      child: Icon(
                        Icons.coronavirus,
                        color: Colors.white.withAlpha(100),
                        size: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.all(
                          SpaceConfig.normalSpace + SpaceConfig.shortSpace),
                      child: Icon(
                        Icons.coronavirus,
                        color: Colors.white.withAlpha(100),
                        size: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: Container(
                      padding: EdgeInsets.all(
                          SpaceConfig.normalSpace + SpaceConfig.shortSpace),
                      child: Icon(
                        Icons.coronavirus,
                        color: Colors.white.withAlpha(100),
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(SpaceConfig.normalSpace),
                    child: Text(
                      "Masing-masing orang memiliki respons yang berbeda terhadap COVID-19. Sebagian besar orang yang terpapar virus ini akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa perlu dirawat di rumah sakit.",
                      style: TypeTheme.bigTextFont,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              child: GridView.count(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace - 4),
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
        ),
      ),
    );
  }
}
