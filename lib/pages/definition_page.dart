part of 'pages.dart';

class DefinitionPage extends StatelessWidget {
  const DefinitionPage({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height / 1.5,
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
            ListView(
              children: [
                _description(),
              ],
            ),
            _content(),
          ],
        ),
      ),
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
                "Apa Itu Virus Corona?",
                style: TypeTheme.subTitleTextFont.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Text(
                "Virus corona (COVID-19) adalah penyakit menular yang disebabkan oleh virus corona yang baru-baru ini ditemukan. Sebagian besar orang yang tertular COVID-19 akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa penanganan khusus.",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: SpaceConfig.longSpace),
              Text(
                "Cara Penyebaran Virus",
                style: TypeTheme.subTitleTextFont.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Text(
                "Virus yang menyebabkan COVID-19 disebarkan melalui droplet (percikan air liur) yang dihasilkan saat orang yang terinfeksi batuk, bersin, atau bernapas. Droplet ini terlalu berat dan tidak bisa bertahan di udara, sehingga dengan cepat jatuh dan menempel pada suatu permukaan. Anda dapat tertular saat menghirup udara yang mengandung virus atau menyentuh permukaan benda yang terkontaminasi lalu menyentuh mata, hidung, atau mulut Anda.",
                style: TypeTheme.normalTextFont.copyWith(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: SpaceConfig.normalSpace),
            ],
          );
        },
      ),
    );
  }

  _content() {
    return DraggableScrollableSheet(
      initialChildSize: 0.30,
      maxChildSize: 0.70,
      minChildSize: 0.30,
      builder: (context, scrollController) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            primary: false,
            controller: scrollController,
            dragStartBehavior: DragStartBehavior.down,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5 -
                  2 * SpaceConfig.longSpace,
              decoration: BoxDecoration(
                color: ColorTheme.bgLight,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(SpaceConfig.longSpace)),
              ),
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
                  SizedBox(height: SpaceConfig.longSpace),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                    child: Text(
                      "Apakah Kamu Perlu?",
                      style: TypeTheme.subTitleTextFont
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: SpaceConfig.normalSpace),
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
                            imagePath: 'assets/images/illustration-doctor.png',
                            title: 'Dokter',
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
                            imagePath:
                                'assets/images/illustration-medicine.png',
                            title: 'Obat',
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
                            imagePath:
                                'assets/images/illustration-hospital.png',
                            title: 'Rumah Sakit',
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
                            imagePath:
                                'assets/images/illustration-donation.png',
                            title: 'Donasi',
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
    );
  }
}