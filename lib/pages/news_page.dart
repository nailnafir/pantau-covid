part of 'pages.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final webScraper = WebScraper('https://health.detik.com');

  List<Map<String, dynamic>>? newsTitle;
  late List<Map<String, dynamic>> newsTime;
  late List<Map<String, dynamic>> newsImage;
  late List<Map<String, dynamic>> newsUrl;

  void fetchNews() async {
    if (await webScraper.loadWebPage('/berita-detikhealth')) {
      setState(() {
        newsTitle = webScraper
            .getElement('li > article > a > div.box_text > h2', ['title']);
        print(newsTitle);

        newsTime = webScraper.getElement(
            'li > article > a > div.box_text > span.date', ['class']);
        print(newsTime);

        newsImage = webScraper.getElement(
            'li > article > a > span.box_img > span.ratiobox_content > img',
            ['src']);
        print(newsImage);

        newsUrl = webScraper.getElement('li > article > a', ['href']);
        print(newsUrl);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

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
                  height: 250,
                  color: ColorTheme.primaryColor,
                ),
                Positioned(
                  top: -180,
                  left: -150,
                  child: Bubble(
                    color: ColorTheme.secondaryColor,
                    width: 300,
                    height: 300,
                  ),
                ),
                Positioned(
                  top: 30,
                  right: -50,
                  child: Bubble(
                    color: ColorTheme.secondaryColor,
                    width: 100,
                    height: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  height: 300,
                  decoration: BoxDecoration(
                    color: ColorTheme.bgLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SpaceConfig.longSpace),
                      topRight: Radius.circular(SpaceConfig.longSpace),
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
      children: [
        _greetings(),
        _slider(),
        _content(),
      ],
    );
  }

  _greetings() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
            vertical: SpaceConfig.normalSpace,
          ),
          child: Welcome(),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
      ],
    );
  }

  _slider() {
    double contentHeight = 280;
    double contentWidth = 200;
    return newsTitle == null
        ? Container(
            margin: EdgeInsets.only(top: 100),
            child: SpinKitWave(
              color: ColorTheme.secondaryColor,
              size: 100,
            ),
          )
        : SizedBox(
            height: contentHeight,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsTitle!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      launch(
                        newsUrl[index]['attributes']['href'],
                        forceWebView: true,
                      );
                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.only(
                        top: SpaceConfig.shortSpace,
                        bottom: SpaceConfig.shortSpace,
                        left: (index == 0) ? SpaceConfig.longSpace : 0,
                        right: (index == newsTitle!.length - 1)
                            ? SpaceConfig.longSpace
                            : SpaceConfig.normalSpace,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace)),
                      child: Container(
                        padding: EdgeInsets.all(SpaceConfig.normalSpace),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: contentWidth,
                              height:
                                  contentHeight / 2 - SpaceConfig.shortSpace,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    newsImage[index]['attributes']['src'],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: contentWidth,
                              height: contentHeight / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsTitle![index]['title'],
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.clip,
                                    style: TypeTheme.normalTextFont.copyWith(
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                  ),
                                  Text(
                                    newsTime[index]['title'],
                                    style: TypeTheme.smallTextFont.copyWith(
                                      fontSize: 12,
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
                  );
                }),
          );
  }

  _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(
            SpaceConfig.longSpace,
            SpaceConfig.longSpace,
            SpaceConfig.longSpace,
            SpaceConfig.shortSpace,
          ),
          child: Text(
            "Berita Hari Ini",
            style: TypeTheme.subTitleTextFont
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        newsTitle == null
            ? Container(
                margin: EdgeInsets.only(top: 100),
                child: SpinKitWave(
                  color: ColorTheme.secondaryColor,
                  size: 100,
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 3 +
                    SpaceConfig.normalSpace,
                child: ListView.builder(
                    itemCount: newsTitle!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          launch(
                            newsUrl[index]['attributes']['href'],
                            forceWebView: true,
                          );
                        },
                        child: Card(
                          elevation: 2,
                          margin: EdgeInsets.only(
                            top: 0,
                            bottom: (index == newsTitle!.length - 1)
                                ? SpaceConfig.longSpace
                                : SpaceConfig.normalSpace,
                            left: SpaceConfig.longSpace,
                            right: SpaceConfig.longSpace,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace)),
                          child: Container(
                            padding: EdgeInsets.all(SpaceConfig.normalSpace),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SpaceConfig.normalSpace),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        newsImage[index]['attributes']['src'],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SpaceConfig.longSpace),
                                  width: MediaQuery.of(context).size.width -
                                      3 * SpaceConfig.longSpace -
                                      2 * SpaceConfig.normalSpace -
                                      100,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsTitle![index]['title'],
                                        maxLines: 3,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.clip,
                                        style:
                                            TypeTheme.normalTextFont.copyWith(
                                          fontWeight: FontWeight.w500,
                                          height: 1.2,
                                        ),
                                      ),
                                      Text(
                                        newsTime[index]['title'],
                                        style: TypeTheme.smallTextFont.copyWith(
                                          fontSize: 12,
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
                      );
                    }),
              ),
      ],
    );
  }
}
