part of 'pages.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
          "Tentang Aplikasi",
          style: TypeTheme.titleTextFont.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child:
                    Lottie.asset('assets/images/illustration-developer.json'),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Keterangan",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "Aplikasi untuk memberikan informasi terkait COVID-19 di Indonesia dengan bebearpa sumber data.",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Data COVID-19",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "covid19.go.id",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "kemkes.go.id",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kabar Berita",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "detik.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "merdeka.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kesehatan",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "halodoc.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "alodokter.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bantuan Sosial",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "kitabisa.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ilustrasi",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "freepik.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "lottiefiles.com",
                        style: TypeTheme.normalTextFont
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace)),
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pantau COVID-19",
                          style: TypeTheme.bigTextFont.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(
                        color: Colors.grey,
                        height: SpaceConfig.longSpace,
                      ),
                      Text(
                        "Versi 1.3.0",
                        style: TypeTheme.normalTextFont.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Hak Cipta ©2020-${DateTime.now().year}. Nailul Firdaus",
                        style: TypeTheme.normalTextFont.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
            ],
          ),
        ],
      ),
    );
  }
}
