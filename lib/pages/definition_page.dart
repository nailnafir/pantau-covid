part of 'pages.dart';

class DefinitionPage extends StatelessWidget {
  const DefinitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ColorTheme.primaryColor,
        leading: Container(
          margin: EdgeInsets.only(left: SpaceConfig.normalSpace),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        title: Text(
          "Penjelasan COVID-19",
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
              height: MediaQuery.of(context).size.height / 1.2,
            ),
            Positioned(
              top: -150,
              left: -150,
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
            Stack(
              children: [
                _description(),
                _content(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _description() {
    return Container(
      padding: EdgeInsets.all(SpaceConfig.longSpace),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Apa Itu Virus Corona?",
                style: TypeTheme.subTitleTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Text(
                "Virus corona (COVID-19) adalah penyakit menular yang disebabkan oleh virus corona yang baru-baru ini ditemukan. Sebagian besar orang yang tertular COVID-19 akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa penanganan khusus.",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          SizedBox(height: SpaceConfig.longSpace),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Cara Penyebaran Virus",
                style: TypeTheme.subTitleTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Text(
                "Virus yang menyebabkan COVID-19 disebarkan melalui droplet (percikan air liur) yang dihasilkan saat orang yang terinfeksi batuk, bersin, atau bernapas. Droplet ini terlalu berat dan tidak bisa bertahan di udara, sehingga dengan cepat jatuh dan menempel pada suatu permukaan. Anda dapat tertular saat menghirup udara yang mengandung virus atau menyentuh permukaan benda yang terkontaminasi lalu menyentuh mata, hidung, atau mulut Anda.",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          SizedBox(height: SpaceConfig.normalSpace),
        ],
      ),
    );
  }

  _content(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: 350 * 2),
      child: DraggableScrollableSheet(
        initialChildSize:
            (MediaQuery.of(context).size.height > 720) ? 0.45 : 0.18,
        maxChildSize: (MediaQuery.of(context).size.height > 720) ? 0.64 : 0.80,
        minChildSize: 0.18,
        builder: (context, scrollController) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorTheme.bgLight,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(SpaceConfig.longSpace)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
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
                    FadeInUp(
                      delay: Duration(milliseconds: 350 * 4),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SpaceConfig.longSpace,
                          vertical: SpaceConfig.normalSpace,
                        ),
                        child: Text(
                          "Apakah Kamu Perlu?",
                          style: TypeTheme.subTitleTextFont,
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: Duration(milliseconds: 350 * 5),
                      child: GridView.count(
                        padding: EdgeInsets.symmetric(
                            horizontal: SpaceConfig.longSpace - 4),
                        crossAxisCount: 2,
                        crossAxisSpacing: SpaceConfig.shortSpace,
                        mainAxisSpacing: SpaceConfig.shortSpace,
                        childAspectRatio: 1.0,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (await canLaunch(
                                  "https://www.halodoc.com/tanya-dokter")) {
                                await launch(
                                  "https://www.halodoc.com/tanya-dokter",
                                  enableDomStorage: true,
                                  enableJavaScript: true,
                                  forceWebView: true,
                                );
                              }
                            },
                            child: NormalBoxCard(
                              iconImage: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/illustration-doctor.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: 'Dokter',
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              if (await canLaunch(
                                  "https://www.halodoc.com/obat-dan-vitamin")) {
                                await launch(
                                  "https://www.halodoc.com/obat-dan-vitamin",
                                  enableDomStorage: true,
                                  enableJavaScript: true,
                                  forceWebView: true,
                                );
                              }
                            },
                            child: NormalBoxCard(
                              iconImage: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/illustration-medicine.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: 'Obat',
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              if (await canLaunch(
                                  "http://yankes.kemkes.go.id/app/siranap/")) {
                                await launch(
                                  "http://yankes.kemkes.go.id/app/siranap/",
                                  enableDomStorage: true,
                                  enableJavaScript: true,
                                  forceWebView: true,
                                );
                              }
                            },
                            child: NormalBoxCard(
                              iconImage: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/illustration-hospital.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: 'Rumah Sakit',
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              if (await canLaunch(
                                  "https://kitabisa.com/campaign/daruratcovid2021")) {
                                await launch(
                                  "https://kitabisa.com/campaign/daruratcovid2021",
                                  enableDomStorage: true,
                                  enableJavaScript: true,
                                  forceWebView: true,
                                );
                              }
                            },
                            child: NormalBoxCard(
                              iconImage: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/illustration-donation.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: 'Donasi',
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
