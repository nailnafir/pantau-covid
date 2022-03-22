part of 'pages.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: SafeArea(
        child: RefreshIndicator(
          color: ColorTheme.secondaryColor,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              context.read<NewsBloc>().add(LoadingNews());

              context.read<NewsBloc>().add(FetchNews());
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
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          List<ArticleModel> articles = state.news.articles.sublist(0, 10);
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    launch(
                      articles[index].url,
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
                      right: (index == 10)
                          ? SpaceConfig.longSpace
                          : SpaceConfig.normalSpace,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace)),
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(SpaceConfig.normalSpace),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 220 / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  articles[index].urlToImage,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SpaceConfig.shortSpace),
                          Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articles[index].title,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: TypeTheme.normalTextFont.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: SpaceConfig.shortSpace),
                                Text(
                                  articles[index].sourceName.toLowerCase(),
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
                                    SizedBox(width: SpaceConfig.shortSpace),
                                    Text(
                                      DateFormat.d()
                                          .add_yMMMM()
                                          .addPattern('•')
                                          .add_Hms()
                                          .format((DateTime.parse(
                                              articles[index].publishedAt)))
                                          .replaceAll('Monday', 'Senin,')
                                          .replaceAll('Tuesday', 'Selasa,')
                                          .replaceAll('Wednesday', 'Rabu,')
                                          .replaceAll('Thursday', 'Kamis,')
                                          .replaceAll('Friday', 'Jumat,')
                                          .replaceAll('Saturday', 'Sabtu,')
                                          .replaceAll('Sunday', 'Minggu,')
                                          .replaceAll('January', 'Januari')
                                          .replaceAll('February', 'Februari')
                                          .replaceAll('March', 'Maret')
                                          .replaceAll('April', 'April')
                                          .replaceAll('May', 'Mei')
                                          .replaceAll('June', 'Juni')
                                          .replaceAll('July', 'Juli')
                                          .replaceAll('August', 'Agustus')
                                          .replaceAll('September', 'September')
                                          .replaceAll('October', 'Oktober')
                                          .replaceAll('November', 'November')
                                          .replaceAll('December', 'Desember'),
                                      style: TypeTheme.smallTextFont.copyWith(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                      ),
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
              },
            ),
          );
        } else {
          return SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ShimmerLoading(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(
                    top: SpaceConfig.shortSpace,
                    bottom: SpaceConfig.shortSpace,
                    left: (index == 0) ? SpaceConfig.longSpace : 0,
                    right: (index == 10)
                        ? SpaceConfig.longSpace
                        : SpaceConfig.normalSpace,
                  ),
                );
              },
            ),
          );
        }
      },
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
            "Berita Lainnya",
            style: TypeTheme.subTitleTextFont,
          ),
        ),
        BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is NewsLoaded) {
            List<ArticleModel> articles = state.news.articles.sublist(10, 20);
            return Column(
              children: List.generate(
                articles.length,
                (index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.only(
                      top: 0,
                      bottom: (index == articles.length)
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
                                  articles[index].urlToImage,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articles[index].title,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: TypeTheme.normalTextFont.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      articles[index].sourceName.toLowerCase(),
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
                                        SizedBox(width: SpaceConfig.shortSpace),
                                        Text(
                                          DateFormat.d()
                                              .add_yMMMM()
                                              .addPattern('•')
                                              .add_Hms()
                                              .format((DateTime.parse(
                                                  articles[index].publishedAt)))
                                              .replaceAll('Monday', 'Senin,')
                                              .replaceAll('Tuesday', 'Selasa,')
                                              .replaceAll('Wednesday', 'Rabu,')
                                              .replaceAll('Thursday', 'Kamis,')
                                              .replaceAll('Friday', 'Jumat,')
                                              .replaceAll('Saturday', 'Sabtu,')
                                              .replaceAll('Sunday', 'Minggu,')
                                              .replaceAll('January', 'Januari')
                                              .replaceAll(
                                                  'February', 'Februari')
                                              .replaceAll('March', 'Maret')
                                              .replaceAll('April', 'April')
                                              .replaceAll('May', 'Mei')
                                              .replaceAll('June', 'Juni')
                                              .replaceAll('July', 'Juli')
                                              .replaceAll('August', 'Agustus')
                                              .replaceAll(
                                                  'September', 'September')
                                              .replaceAll('October', 'Oktober')
                                              .replaceAll(
                                                  'November', 'November')
                                              .replaceAll(
                                                  'December', 'Desember'),
                                          style:
                                              TypeTheme.smallTextFont.copyWith(
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
                  );
                },
              ),
            );
          } else {
            return Column(
              children: List.generate(
                10,
                (index) {
                  return ShimmerLoading(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    margin: EdgeInsets.only(
                      top: SpaceConfig.shortSpace,
                      bottom: (index == 10)
                          ? SpaceConfig.longSpace
                          : SpaceConfig.normalSpace,
                      left: SpaceConfig.longSpace,
                      right: SpaceConfig.longSpace,
                    ),
                  );
                },
              ),
            );
          }
        }),
      ],
    );
  }
}
