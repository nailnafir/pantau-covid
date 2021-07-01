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
    return SafeArea(
      child: Scaffold(
        body: newsTitle == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
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
                      margin: EdgeInsets.symmetric(
                        horizontal: SpaceConfig.longSpace,
                        vertical: SpaceConfig.shortSpace,
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
                                    newsImage[index]['attributes']['src'],
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
      ),
    );
  }
}
