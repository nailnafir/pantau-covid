part of 'pages.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GlobalKey<RefreshIndicatorState> refreshData =
      new GlobalKey<RefreshIndicatorState>();

  TextEditingController editingController = TextEditingController();

  CaseTotalModel? caseTotal;
  CheckModel? check;
  VaccineModel? vaccine;
  AllProvinceModel? allProvince;
  List<DetailProvinceModel>? detailProvince;
  LocationModel? location;

  int _current = 0;

  List imgBanner = [
    'assets/images/banner-one.jpg',
    'assets/images/banner-two.jpg',
    'assets/images/banner-three.jpg',
    'assets/images/banner-four.jpg',
  ];
  List bannerURL = [
    'https://promkes.kemkes.go.id/cegah-virus-corona-jaga-kesehatan-dengan-germas',
    'https://kipi.covid19.go.id/',
    'https://sehatnegeriku.kemkes.go.id/baca/umum/20200125/2832840/wni-wuhan-tak-ada-terjangkit-ncov/',
    'https://linktr.ee/covid19.go.id',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshData,
          color: ColorTheme.secondaryColor,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {});
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
                    height: 100,
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
        FadeInDown(
          delay: Duration(milliseconds: 350),
          child: _greetings(),
        ),
        FadeInDown(
          delay: Duration(milliseconds: 350 * 2),
          child: _slider(),
        ),
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
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(_singleSlider(i));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 150,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: list,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4].map((i) {
            int index = [1, 2, 3, 4].indexOf(i);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: BoxDecoration(
                color: _current == index
                    ? ColorTheme.secondaryColor
                    : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  _singleSlider(int index) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(bannerURL[index])) {
          await launch(
            bannerURL[index],
            forceWebView: true,
            enableJavaScript: true,
            enableDomStorage: true,
          );
        } else {
          throw Exception('Tidak dapat mengalihkan URL');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: SpaceConfig.longSpace - 4,
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
          child: Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: ColorTheme.bgLight,
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.normalSpace)),
                ),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgBanner[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SpaceConfig.normalSpace),
        FadeInDown(
          delay: Duration(milliseconds: 350 * 3),
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: SpaceConfig.longSpace - 4,
            ),
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                SpaceConfig.shortSpace - 2,
                SpaceConfig.longSpace,
                SpaceConfig.normalSpace,
                SpaceConfig.longSpace,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: ColorTheme.secondaryColor,
                  ),
                  SizedBox(width: SpaceConfig.shortSpace / 2),
                  FutureBuilder(
                    future: LocationService.getUserLocation(),
                    builder: (BuildContext context,
                        AsyncSnapshot<LocationModel> snapshot) {
                      if (snapshot.hasData) {
                        location = snapshot.data;
                        return Container(
                          width: Get.width / 1.75,
                          child: Text(
                            location!.address,
                            overflow: TextOverflow.ellipsis,
                            style: TypeTheme.normalTextFont
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                          ),
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.grey[300]!,
                            height: 18,
                            width: Get.width / 3,
                          ),
                        );
                      }
                    },
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.shortSpace,
                      vertical: SpaceConfig.shortSpace / 2,
                    ),
                    decoration: BoxDecoration(
                        color: ColorTheme.secondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "Lokasimu",
                      style: TypeTheme.smallTextFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.longSpace),
        //NOTE: CASE
        _case(),
        SizedBox(height: SpaceConfig.longSpace),
        //NOTE: VACCINE
        _vaccine(),
        SizedBox(height: SpaceConfig.longSpace),
        //NOTE: CHECKUP
        _check(),
        SizedBox(height: SpaceConfig.longSpace),
        //NOTE: MAP
        _map(),
        SizedBox(height: SpaceConfig.normalSpace),
      ],
    );
  }

  _case() {
    bool isTyping = false;
    bool isScroll = false;

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          BottomSheet(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SpaceConfig.longSpace)),
            ),
            onClosing: () {},
            enableDrag: false,
            backgroundColor: ColorTheme.bgLight,
            builder: (context) {
              return StatefulBuilder(builder: (BuildContext context, setState) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
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
                      delay: Duration(milliseconds: 350),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            margin: EdgeInsets.fromLTRB(
                              SpaceConfig.longSpace - 4,
                              SpaceConfig.normalSpace,
                              0,
                              SpaceConfig.normalSpace,
                            ),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace)),
                            color: Colors.white,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width -
                                  2 * SpaceConfig.longSpace -
                                  50,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                style: TypeTheme.normalTextFont,
                                controller: editingController,
                                onChanged: (value) {
                                  setState(() {
                                    isTyping = value.length >= 1;
                                  });
                                },
                                decoration: InputDecoration(
                                    suffixIcon: isTyping
                                        ? IconButton(
                                            color: ColorTheme.redColor,
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              setState(() {
                                                editingController.text = '';

                                                isTyping = !isTyping;
                                              });
                                            },
                                          )
                                        : SizedBox(),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: "Cari Provinsi...."),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Card(
                              margin: EdgeInsets.fromLTRB(
                                0,
                                SpaceConfig.normalSpace,
                                SpaceConfig.longSpace - 4,
                                SpaceConfig.normalSpace,
                              ),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                              color: ColorTheme.secondaryColor,
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: NotificationListener(
                        onNotification: (notification) {
                          if (notification is ScrollStartNotification) {
                            isScroll = true;
                          } else if (notification is ScrollEndNotification) {
                            isScroll = true;
                          } else {
                            isScroll = true;
                          }
                          return true;
                        },
                        child: FutureBuilder(
                          future: AllProvinceService.getAllProvince(),
                          builder: (BuildContext context,
                              AsyncSnapshot<AllProvinceModel> snapshot) {
                            if (snapshot.hasData) {
                              allProvince = snapshot.data;
                              return ListView.builder(
                                itemCount: allProvince!.listData.length,
                                itemBuilder: (context, index) {
                                  if (editingController.text.isEmpty) {
                                    return FadeInUp(
                                      delay: Duration(
                                          milliseconds:
                                              isScroll ? 0 : 350 * (index + 2)),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: (index == 0
                                                ? 0
                                                : SpaceConfig.normalSpace),
                                            bottom: (index ==
                                                    allProvince!
                                                            .listData.length -
                                                        1
                                                ? SpaceConfig.normalSpace
                                                : 0)),
                                        child: DetailBoxCard(
                                          summaryPositive:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .confirmedTotal),
                                          updatePositive: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .confirmedUpdate),
                                          summaryActive:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .activeTotal),
                                          updateActive: "-0",
                                          summaryRecovered:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .recoveredTotal),
                                          updateRecovered: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .recoveredUpdate),
                                          summaryDeaths:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .deathsTotal),
                                          updateDeaths: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .deathsUpdate),
                                          provinceName: allProvince!
                                              .listData[index].provinceName,
                                          lastUpdate: DateFormat.EEEE()
                                              .add_d()
                                              .add_yMMMM()
                                              .format((DateTime.parse(
                                                  allProvince!.lastUpdate)))
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
                                        ),
                                      ),
                                    );
                                  } else if (allProvince!
                                      .listData[index].provinceName
                                      .trim()
                                      .replaceAll(RegExp(r"\s+"), "")
                                      .toLowerCase()
                                      .contains(editingController.text
                                          .trim()
                                          .replaceAll(RegExp(r"\s+"), "")
                                          .toLowerCase())) {
                                    return FadeInUp(
                                      delay: Duration(
                                          milliseconds: isScroll ? 0 : 350),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: (index == 0
                                                ? 0
                                                : SpaceConfig.normalSpace),
                                            bottom: (index ==
                                                    allProvince!
                                                            .listData.length -
                                                        1
                                                ? SpaceConfig.normalSpace
                                                : 0)),
                                        child: DetailBoxCard(
                                          summaryPositive:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .confirmedTotal),
                                          updatePositive: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .confirmedUpdate),
                                          summaryActive:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .activeTotal),
                                          updateActive: "-0",
                                          summaryRecovered:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .recoveredTotal),
                                          updateRecovered: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .recoveredUpdate),
                                          summaryDeaths:
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .deathsTotal),
                                          updateDeaths: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(allProvince!
                                                      .listData[index]
                                                      .update
                                                      .deathsUpdate),
                                          provinceName: allProvince!
                                              .listData[index].provinceName,
                                          lastUpdate: DateFormat.EEEE()
                                              .add_d()
                                              .add_yMMMM()
                                              .format((DateTime.parse(
                                                  allProvince!.lastUpdate)))
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
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            } else {
                              return FadeInUp(
                                delay: Duration(milliseconds: 350 * 2),
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                          SpaceConfig.longSpace,
                                          0,
                                          SpaceConfig.longSpace,
                                          SpaceConfig.normalSpace,
                                        ),
                                        height: 230,
                                        width:
                                            Get.width - SpaceConfig.shortSpace,
                                        decoration: BoxDecoration(
                                            color: ColorTheme.bgLight,
                                            borderRadius: BorderRadius.circular(
                                                SpaceConfig.normalSpace)),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        );
      },
      child: Column(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 350 * 4),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SpaceConfig.longSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jumlah Kasus",
                        style: TypeTheme.subTitleTextFont,
                      ),
                      Shimmer.fromColors(
                        baseColor: ColorTheme.secondaryColor,
                        highlightColor: ColorTheme.tertiaryColor,
                        child: Text(
                          "Lihat Semua",
                          style: TypeTheme.smallTextFont.copyWith(
                            color: ColorTheme.secondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: CaseTotalService.getTotalCase(),
                    builder: (BuildContext context,
                        AsyncSnapshot<CaseTotalModel> snapshot) {
                      if (snapshot.hasData) {
                        caseTotal = snapshot.data;
                        return Text(
                            "Diperbarui pada " +
                                DateFormat.EEEE()
                                    .add_d()
                                    .add_yMMMM()
                                    .addPattern('•')
                                    .add_Hms()
                                    .format(
                                        (DateTime.parse(caseTotal!.lastUpdate)))
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
                            style: TypeTheme.smallTextFont);
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 18,
                            width: (MediaQuery.of(context).size.width -
                                    2 * SpaceConfig.longSpace) -
                                80,
                            decoration: BoxDecoration(
                                color: ColorTheme.bgLight,
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace)),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          FutureBuilder(
            future: CaseTotalService.getTotalCase(),
            builder:
                (BuildContext context, AsyncSnapshot<CaseTotalModel> snapshot) {
              if (snapshot.hasData) {
                caseTotal = snapshot.data;
                return FadeInDown(
                  delay: Duration(milliseconds: 350 * 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SpaceConfig.longSpace - 4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: Icons.add_circle_rounded,
                                iconSize: 100,
                                margin: EdgeInsets.only(
                                    right: SpaceConfig.shortSpace - 2),
                                summary: NumberFormat.decimalPattern()
                                    .format(caseTotal!.confirmedTotal),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(caseTotal!.confirmedUpdate),
                                cases: "Positif",
                                color: ColorTheme.secondaryColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: Icons.remove_circle_rounded,
                                iconSize: 100,
                                margin: EdgeInsets.only(
                                    right: SpaceConfig.shortSpace - 2),
                                summary: NumberFormat.decimalPattern()
                                    .format(caseTotal!.activeTotal),
                                update: NumberFormat.decimalPattern()
                                    .format(caseTotal!.activeUpdate),
                                cases: "Dirawat",
                                color: ColorTheme.blueColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SpaceConfig.shortSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: Icons.change_circle_rounded,
                                margin: EdgeInsets.only(
                                    right: SpaceConfig.shortSpace - 2),
                                iconSize: 100,
                                summary: NumberFormat.decimalPattern()
                                    .format(caseTotal!.recoveredTotal),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(caseTotal!.recoveredUpdate),
                                cases: "Sembuh",
                                color: ColorTheme.greenColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: Icons.cancel_rounded,
                                iconSize: 100,
                                margin: EdgeInsets.only(
                                    right: SpaceConfig.shortSpace - 2),
                                summary: NumberFormat.decimalPattern()
                                    .format(caseTotal!.deathsTotal),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(caseTotal!.deathsUpdate),
                                cases: "Meninggal",
                                color: ColorTheme.redColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return FadeInDown(
                  delay: Duration(milliseconds: 350 * 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: List.generate(2, (index) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: SpaceConfig.normalSpace - 4,
                            left: SpaceConfig.longSpace,
                            right: SpaceConfig.longSpace,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SpaceConfig.shortSpace),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                width: (Get.width - 3 * SpaceConfig.longSpace) /
                                        2 +
                                    4,
                                height: 120 - 4,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SpaceConfig.shortSpace),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                width: (Get.width - 3 * SpaceConfig.longSpace) /
                                        2 +
                                    4,
                                height: 120 - 4,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  _vaccine() {
    return Column(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 350 * 4),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: SpaceConfig.longSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jumlah Vaksinasi",
                      style: TypeTheme.subTitleTextFont,
                    ),
                    Shimmer.fromColors(
                      baseColor: ColorTheme.secondaryColor,
                      highlightColor: ColorTheme.tertiaryColor,
                      child: Text(
                        "Lihat Semua",
                        style: TypeTheme.smallTextFont.copyWith(
                          color: ColorTheme.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: VaccineService.getVaccine(),
                  builder: (BuildContext context,
                      AsyncSnapshot<VaccineModel> snapshot) {
                    if (snapshot.hasData) {
                      vaccine = snapshot.data;
                      return Text(
                          "Diperbarui pada " +
                              DateFormat.EEEE()
                                  .add_d()
                                  .add_yMMMM()
                                  .addPattern('•')
                                  .add_Hms()
                                  .format((DateTime.parse(vaccine!.lastUpdate)))
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
                          style: TypeTheme.smallTextFont);
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 18,
                          width: (MediaQuery.of(context).size.width -
                                  2 * SpaceConfig.longSpace) -
                              80,
                          decoration: BoxDecoration(
                              color: ColorTheme.bgLight,
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace)),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        FutureBuilder(
          future: VaccineService.getVaccine(),
          builder:
              (BuildContext context, AsyncSnapshot<VaccineModel> snapshot) {
            if (snapshot.hasData) {
              vaccine = snapshot.data;
              return FadeInDown(
                delay: Duration(milliseconds: 350 * 5),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: FontAwesomeIcons.syringe,
                              iconSize: 80,
                              margin: EdgeInsets.only(
                                right: SpaceConfig.shortSpace + 6,
                                bottom: SpaceConfig.shortSpace,
                              ),
                              summary: NumberFormat.decimalPattern()
                                  .format(vaccine!.updateVaccineFirst),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(vaccine!.totalVaccineFirst),
                              cases: "Dosis Pertama",
                              color: ColorTheme.blueColor,
                            ),
                          ),
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: FontAwesomeIcons.syringe,
                              iconSize: 80,
                              margin: EdgeInsets.only(
                                right: SpaceConfig.shortSpace + 6,
                                bottom: SpaceConfig.shortSpace,
                              ),
                              summary: NumberFormat.decimalPattern()
                                  .format(vaccine!.updateVaccineSecond),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(vaccine!.totalVaccineSecond),
                              cases: "Dosis Kedua",
                              color: ColorTheme.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return FadeInDown(
                delay: Duration(milliseconds: 350 * 5),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: List.generate(1, (index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: SpaceConfig.normalSpace - 4,
                          left: SpaceConfig.longSpace,
                          right: SpaceConfig.longSpace,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace),
                              ),
                              width:
                                  (Get.width - 3 * SpaceConfig.longSpace) / 2 +
                                      4,
                              height: 120 - 4,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: SpaceConfig.shortSpace),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace),
                              ),
                              width:
                                  (Get.width - 3 * SpaceConfig.longSpace) / 2 +
                                      4,
                              height: 120 - 4,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }

  _check() {
    return Column(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 350 * 4),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: SpaceConfig.longSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jumlah Pemeriksaan",
                      style: TypeTheme.subTitleTextFont,
                    ),
                    Shimmer.fromColors(
                      baseColor: ColorTheme.secondaryColor,
                      highlightColor: ColorTheme.tertiaryColor,
                      child: Text(
                        "Lihat Semua",
                        style: TypeTheme.smallTextFont.copyWith(
                          color: ColorTheme.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: CheckService.getCheck(),
                  builder: (BuildContext context,
                      AsyncSnapshot<CheckModel> snapshot) {
                    if (snapshot.hasData) {
                      check = snapshot.data;
                      return Text(
                          "Diperbarui pada " +
                              DateFormat.EEEE()
                                  .add_d()
                                  .add_yMMMM()
                                  .addPattern('•')
                                  .add_Hms()
                                  .format((DateTime.parse(check!.lastUpdate)))
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
                          style: TypeTheme.smallTextFont);
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 18,
                          width: (MediaQuery.of(context).size.width -
                                  2 * SpaceConfig.longSpace) -
                              80,
                          decoration: BoxDecoration(
                              color: ColorTheme.bgLight,
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace)),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        FutureBuilder(
          future: CheckService.getCheck(),
          builder: (BuildContext context, AsyncSnapshot<CheckModel> snapshot) {
            if (snapshot.hasData) {
              check = snapshot.data;
              return FadeInDown(
                delay: Duration(milliseconds: 350 * 5),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: FontAwesomeIcons.vial,
                              iconSize: 80,
                              margin: EdgeInsets.only(
                                right: SpaceConfig.shortSpace + 6,
                                bottom: SpaceConfig.shortSpace,
                              ),
                              summary: NumberFormat.decimalPattern()
                                  .format(check!.updatePeoplePcr),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(check!.totalPeoplePcr),
                              cases: "Tes PCR",
                              color: ColorTheme.greenColor,
                            ),
                          ),
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: FontAwesomeIcons.vial,
                              iconSize: 80,
                              margin: EdgeInsets.only(
                                right: SpaceConfig.shortSpace + 6,
                                bottom: SpaceConfig.shortSpace,
                              ),
                              summary: NumberFormat.decimalPattern()
                                  .format(check!.updatePeopleAntigen),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(check!.totalPeopleAntigen),
                              cases: "Tes Antigen",
                              color: ColorTheme.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return FadeInDown(
                delay: Duration(milliseconds: 350 * 5),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: List.generate(1, (index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: SpaceConfig.normalSpace - 4,
                          left: SpaceConfig.longSpace,
                          right: SpaceConfig.longSpace,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace),
                              ),
                              width:
                                  (Get.width - 3 * SpaceConfig.longSpace) / 2 +
                                      4,
                              height: 120 - 4,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: SpaceConfig.shortSpace),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace),
                              ),
                              width:
                                  (Get.width - 3 * SpaceConfig.longSpace) / 2 +
                                      4,
                              height: 120 - 4,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }

  _map() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 350 * 8),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: SpaceConfig.longSpace,
            ),
            child: Text(
              "Peta Sebaran",
              style: TypeTheme.subTitleTextFont,
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        FadeInDown(
          delay: Duration(milliseconds: 350 * 9),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: SpaceConfig.longSpace - 4,
            ),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
              child: Container(
                padding: EdgeInsets.all(SpaceConfig.normalSpace),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
                child: Container(
                  height: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/image-map-indonesia-covid.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
      ],
    );
  }
}
