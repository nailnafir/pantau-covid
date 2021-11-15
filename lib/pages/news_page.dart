part of 'pages.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final GlobalKey<RefreshIndicatorState> refreshNews =
      new GlobalKey<RefreshIndicatorState>();

  final webScraperSlider = WebScraper('https://health.detik.com');

  final webScraperContent = WebScraper('https://www.merdeka.com');

  List<Map<String, dynamic>>? newsTitleSlider;
  late List<Map<String, dynamic>> newsTimeSlider;
  late List<Map<String, dynamic>> newsImageSlider;
  late List<Map<String, dynamic>> newsUrlSlider;

  List<Map<String, dynamic>>? newsTitleContent;
  late List<Map<String, dynamic>> newsTimeContent;
  late List<Map<String, dynamic>> newsImageContent;
  late List<Map<String, dynamic>> newsUrlContent;

  void fetchNewsSlider() async {
    if (await webScraperSlider.loadWebPage('/berita-detikhealth')) {
      setState(() {
        newsTitleSlider = webScraperSlider
            .getElement('li > article > a > div.box_text > h2', ['title']);
        // print(newsTitleSlider);

        newsTimeSlider = webScraperSlider.getElement(
            'li > article > a > div.box_text > span.date', ['class']);
        // print(newsTimeSlider);

        newsImageSlider = webScraperSlider.getElement(
            'li > article > a > span.box_img > span.ratiobox_content > img',
            ['src']);
        // print(newsImageSlider);

        newsUrlSlider =
            webScraperSlider.getElement('li > article > a', ['href']);
        // print(newsUrlSlider);
      });
    }
  }

  void fetchNewsContent() async {
    if (await webScraperContent.loadWebPage('/tag/covid-19')) {
      setState(() {
        // NOTE: from merdeka
        newsTitleContent = webScraperContent.getElement(
            'div.mdk-tag-contg-rb-small > div.meta-content > div.desc > h3 > a',
            ['title']);
        // print(newsTitleContent);

        newsTimeContent = webScraperContent.getElement(
            'div.mdk-tag-contg-rb-small > div.meta-content > div.desc > span.det-news-date',
            ['class']);
        // print(newsTimeContent);

        newsImageContent = webScraperContent.getElement(
            'div.mdk-tag-contg-rb-small > div.meta-content > div.image > a > img',
            ['src']);
        // print(newsImageContent);

        newsUrlContent = webScraperContent.getElement(
            'div.mdk-tag-contg-rb-small > div.meta-content > div.desc > h3 > a',
            ['href']);
        // print(newsUrlContent);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNewsSlider();
    fetchNewsContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshNews,
          color: ColorTheme.secondaryColor,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1)).whenComplete(() {
              setState(() {
                newsTitleSlider = null;
                newsTitleContent = null;
                fetchNewsSlider();
                fetchNewsContent();
              });
            });
          },
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
                    child: FadeInLeft(
                      child: Bubble(
                        color: ColorTheme.secondaryColor,
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: -50,
                    child: FadeInRight(
                      child: Bubble(
                        color: ColorTheme.secondaryColor,
                        width: 100,
                        height: 100,
                      ),
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
    bool isScroll = false;

    return (newsTitleSlider == null)
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: contentHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return FadeInRight(
                    delay: Duration(milliseconds: 350 * (index + 1)),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? SpaceConfig.longSpace : 0,
                        right: (index == 10)
                            ? SpaceConfig.longSpace
                            : SpaceConfig.normalSpace,
                        top: SpaceConfig.shortSpace,
                        bottom: SpaceConfig.shortSpace,
                      ),
                      width: contentWidth + SpaceConfig.longSpace,
                      height: contentHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                        color: ColorTheme.bgLight,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : SizedBox(
            height: contentHeight,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  isScroll = true;
                }
                return true;
              },
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsTitleSlider!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInRight(
                      delay: Duration(
                          milliseconds: isScroll ? 0 : 350 * (index + 1)),
                      child: GestureDetector(
                        onTap: () {
                          launch(
                            newsUrlSlider[index]['attributes']['href'],
                            forceWebView: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                          );
                        },
                        child: Card(
                          elevation: 2,
                          margin: EdgeInsets.only(
                            top: SpaceConfig.shortSpace,
                            bottom: SpaceConfig.shortSpace,
                            left: (index == 0) ? SpaceConfig.longSpace : 0,
                            right: (index == newsTitleSlider!.length - 1)
                                ? SpaceConfig.longSpace
                                : SpaceConfig.normalSpace,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: contentWidth,
                                  height: contentHeight / 2 -
                                      SpaceConfig.shortSpace,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SpaceConfig.normalSpace),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        newsImageSlider[index]['attributes']
                                            ['src'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsTitleSlider![index]['title'],
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
                                        newsTimeSlider[index]['title'],
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
                      ),
                    );
                  }),
            ),
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
          child: FadeInDown(
            delay: Duration(milliseconds: 350 * 4),
            child: Text(
              "Berita Hari Ini",
              style: TypeTheme.subTitleTextFont
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        (newsTitleContent == null)
            ? Column(
                children: List.generate(10, (index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: FadeInDown(
                      delay: Duration(milliseconds: 350 * (index + 5)),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 0,
                          bottom: (index == 10)
                              ? SpaceConfig.longSpace
                              : SpaceConfig.normalSpace,
                          left: SpaceConfig.longSpace,
                          right: SpaceConfig.longSpace,
                        ),
                        height: 100 + SpaceConfig.longSpace,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace),
                          color: ColorTheme.bgLight,
                        ),
                      ),
                    ),
                  );
                }),
              )
            : Column(
                children: List.generate(10, (index) {
                  return FadeInDown(
                    delay: Duration(milliseconds: 350 * (index + 5)),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.only(
                        top: 0,
                        bottom: (index == newsTitleContent!.length - 1)
                            ? SpaceConfig.longSpace
                            : SpaceConfig.normalSpace,
                        left: SpaceConfig.longSpace,
                        right: SpaceConfig.longSpace,
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
                                    newsImageContent[index + 2]['attributes']
                                        ['src'],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: SpaceConfig.longSpace),
                              width: MediaQuery.of(context).size.width -
                                  3 * SpaceConfig.longSpace -
                                  2 * SpaceConfig.normalSpace -
                                  100,
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsTitleContent![index]['title'],
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.clip,
                                    style: TypeTheme.normalTextFont.copyWith(
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "merdeka.com",
                                        style: TypeTheme.smallTextFont.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ColorTheme.secondaryColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: ColorTheme.secondaryColor,
                                            size: 18,
                                          ),
                                          Text(
                                            newsTimeContent[index + 2]['title'],
                                            style: TypeTheme.smallTextFont
                                                .copyWith(
                                              fontSize: 12,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
