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
                width: LayoutConfig.deviceWidth,
                height: 300,
                child:
                    Lottie.asset('assets/images/illustration-developer.json'),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                child: Text("Keterangan",
                    style: TypeTheme.bigTextFont.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                  vertical: SpaceConfig.normalSpace,
                ),
                color: Colors.white,
                width: double.infinity,
                child: Text(
                  "Aplikasi untuk memberikan informasi terkait COVID-19 di Indonesia dengan bebearpa sumber data.",
                  style: TypeTheme.normalTextFont
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                child: Text("Kasus COVID-19",
                    style: TypeTheme.bigTextFont.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                  vertical: SpaceConfig.normalSpace,
                ),
                color: Colors.white,
                width: double.infinity,
                child: Text(
                  "covid19.go.id\nkemkes.go.id\nkawalcorona.com",
                  style: TypeTheme.normalTextFont
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                child: Text("Kabar Berita",
                    style: TypeTheme.bigTextFont.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                  vertical: SpaceConfig.normalSpace,
                ),
                color: Colors.white,
                width: double.infinity,
                child: Text(
                  "detik.com\nmerdeka.com",
                  style: TypeTheme.normalTextFont
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SpaceConfig.shortSpace),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                child: Text("Ilustrasi",
                    style: TypeTheme.bigTextFont.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace,
                  vertical: SpaceConfig.normalSpace,
                ),
                color: Colors.white,
                width: double.infinity,
                child: Text(
                  "freepik.com\nlottiefiles.com",
                  style: TypeTheme.normalTextFont
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SpaceConfig.normalSpace),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpaceConfig.longSpace),
                width: double.infinity,
                child: Text(
                  "Versi 1.0.0 \nHak Cipta ©${DateTime.now().year}. Nailul Firdaus",
                  style: TypeTheme.normalTextFont.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
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
