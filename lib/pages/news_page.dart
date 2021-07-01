part of 'pages.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.bgLight,
        appBar: AppBar(
          backgroundColor: ColorTheme.secondaryColor,
          leading: Container(
            margin: EdgeInsets.only(left: SpaceConfig.normalSpace),
            child: Icon(
              Icons.menu,
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          title: Text(
            "Berita COVID-19",
            style: TypeTheme.titleTextFont.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: SpaceConfig.longSpace),
              child: Icon(
                Icons.star_border_outlined,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                SpaceConfig.longSpace,
                SpaceConfig.longSpace,
                SpaceConfig.longSpace,
                0,
              ),
              child: Text(
                "Berita utama",
                style: TypeTheme.subTitleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(
                horizontal: SpaceConfig.longSpace,
                vertical: SpaceConfig.shortSpace,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
              child: Container(
                padding: EdgeInsets.all(SpaceConfig.normalSpace),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://asset.kompas.com/crops/qXtWmugrLVc-kTn8q-sWO4sc4AY=/0x0:748x499/750x500/data/photo/2021/02/03/601abee904074.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: SpaceConfig.longSpace),
                      width: MediaQuery.of(context).size.width -
                          3 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace -
                          100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kompas.com",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "UPDATE 27 Juni: 611 Pasien Covid-19 di Kota Tangerang Masih Dirawat.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TypeTheme.smallTextFont.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Jumlah pasien yang meninggal karena Covid-19 di Kota Tangerang bertambah tiga orang sehingga berjumlah 210 orang.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TypeTheme.smallTextFont.copyWith(
                              color: Colors.grey[700],
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "8 jam lalu",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                SpaceConfig.longSpace,
                SpaceConfig.longSpace,
                SpaceConfig.longSpace,
                0,
              ),
              child: Text(
                "Berita Terbaru",
                style: TypeTheme.subTitleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(
                horizontal: SpaceConfig.longSpace,
                vertical: SpaceConfig.shortSpace,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
              child: Container(
                padding: EdgeInsets.all(SpaceConfig.normalSpace),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://asset.kompas.com/crops/qXtWmugrLVc-kTn8q-sWO4sc4AY=/0x0:748x499/750x500/data/photo/2021/02/03/601abee904074.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: SpaceConfig.longSpace),
                      width: MediaQuery.of(context).size.width -
                          3 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace -
                          100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kompas.com",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "UPDATE 27 Juni: 611 Pasien Covid-19 di Kota Tangerang Masih Dirawat.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TypeTheme.smallTextFont.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Jumlah pasien yang meninggal karena Covid-19 di Kota Tangerang bertambah tiga orang sehingga berjumlah 210 orang.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TypeTheme.smallTextFont.copyWith(
                              color: Colors.grey[700],
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "8 jam lalu",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(
                horizontal: SpaceConfig.longSpace,
                vertical: SpaceConfig.shortSpace,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
              child: Container(
                padding: EdgeInsets.all(SpaceConfig.normalSpace),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://asset.kompas.com/crops/qXtWmugrLVc-kTn8q-sWO4sc4AY=/0x0:748x499/750x500/data/photo/2021/02/03/601abee904074.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: SpaceConfig.longSpace),
                      width: MediaQuery.of(context).size.width -
                          3 * SpaceConfig.longSpace -
                          2 * SpaceConfig.normalSpace -
                          100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kompas.com",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "UPDATE 27 Juni: 611 Pasien Covid-19 di Kota Tangerang Masih Dirawat.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TypeTheme.smallTextFont.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Jumlah pasien yang meninggal karena Covid-19 di Kota Tangerang bertambah tiga orang sehingga berjumlah 210 orang.",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TypeTheme.smallTextFont.copyWith(
                              color: Colors.grey[700],
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "8 jam lalu",
                            style: TypeTheme.smallTextFont.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
