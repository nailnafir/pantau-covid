part of 'pages.dart';

class PreventionPage extends StatelessWidget {
  const PreventionPage({Key? key}) : super(key: key);

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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        title: Text(
          "Pencegahan COVID-19",
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Patuhi Protokol Kesehatan!",
            style: TypeTheme.subTitleTextFont.copyWith(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: SpaceConfig.shortSpace),
          Text(
            "Lindungi diri Anda dan orang lain di sekitar Anda dengan mengetahui fakta-fakta terkait virus ini dan mengambil langkah pencegahan yang sesuai. Ikuti saran yang diberikan oleh otoritas kesehatan setempat.",
            style: TypeTheme.normalTextFont.copyWith(
              color: Colors.black.withOpacity(0.5),
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: SpaceConfig.normalSpace),
        ],
      ),
    );
  }

  _content() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpaceConfig.longSpace - 4,
        vertical: SpaceConfig.longSpace,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.bgLight,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(SpaceConfig.longSpace)),
      ),
      child: FadeInUp(
        delay: Duration(milliseconds: 350 * 2),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: SpaceConfig.shortSpace,
              mainAxisSpacing: SpaceConfig.shortSpace,
              childAspectRatio: 1.0,
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                NormalBoxCard(
                  iconImage: Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/prevention-mask.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: 'Masker',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                NormalBoxCard(
                  iconImage: Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/prevention-wash.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: 'Cuci Tangan',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                NormalBoxCard(
                  iconImage: Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/prevention-distance.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: 'Jaga Jarak',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                NormalBoxCard(
                  iconImage: Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/prevention-disinfectant.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: 'Disinfektan',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
