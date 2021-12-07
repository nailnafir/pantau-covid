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
  LocalVaccineModel? localVaccine;
  List<MonitoringVaccineModel>? monitoringVaccine;
  AllProvinceModel? allProvince;
  List<DetailProvinceModel>? detailProvince;
  LocationModel? userLocation;

  int _current = 0;

  List imgBanner = [];
  List bannerURL = [];

  @override
  void initState() {
    super.initState();

    LocationService.getUserLocation().then((value) {
      userLocation = value;
      setState(() {});
    });

    CaseTotalService.fetchTotal('/public/api/update.json').then((value) {
      caseTotal = value;
      setState(() {});
    });

    AllProvinceService.fetchAll('/public/api/prov.json').then((value) {
      allProvince = value;
      setState(() {});
    });

    DetailProvinceService.fetchDetail('/public/api/prov.json').then((value) {
      detailProvince = value;
      setState(() {});
    });

    LocalVaccineService.fetchVaccine('/vaksinasi').then((value) {
      localVaccine = value;
      setState(() {});
    });

    MonitoringVaccineService.fetchVaccine('/vaksinasi').then((value) {
      monitoringVaccine = value;
      setState(() {});
    });

    imgBanner = [
      'assets/images/banner-one.jpg',
      'assets/images/banner-two.jpg',
      'assets/images/banner-three.jpg',
      'assets/images/banner-four.jpg',
    ];

    bannerURL = [
      'https://promkes.kemkes.go.id/cegah-virus-corona-jaga-kesehatan-dengan-germas',
      'https://kipi.covid19.go.id/',
      'https://sehatnegeriku.kemkes.go.id/baca/umum/20200125/2832840/wni-wuhan-tak-ada-terjangkit-ncov/',
      'https://linktr.ee/covid19.go.id',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshData,
          color: ColorTheme.secondaryColor,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1)).whenComplete(() {
              userLocation = null;
              caseTotal = null;
              allProvince = null;
              detailProvince = null;
              localVaccine = null;
              monitoringVaccine = null;

              LocationService.getUserLocation().then((value) {
                userLocation = value;
                setState(() {});
              });

              CaseTotalService.fetchTotal('/public/api/update.json')
                  .then((value) {
                caseTotal = value;
                setState(() {});
              });

              AllProvinceService.fetchAll('/public/api/prov.json')
                  .then((value) {
                allProvince = value;
                setState(() {});
              });

              DetailProvinceService.fetchDetail('/public/api/prov.json')
                  .then((value) {
                detailProvince = value;
                setState(() {});
              });

              LocalVaccineService.fetchVaccine('/vaksinasi').then((value) {
                localVaccine = value;
                setState(() {});
              });

              MonitoringVaccineService.fetchVaccine('/vaksinasi').then((value) {
                monitoringVaccine = value;
                setState(() {});
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
                  (userLocation != null)
                      ? Container(
                          width: Get.width / 1.75,
                          child: Text(
                            userLocation!.address,
                            overflow: TextOverflow.ellipsis,
                            style: TypeTheme.normalTextFont
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                          ),
                        )
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.grey[300]!,
                            height: 18,
                            width: Get.width / 3,
                          ),
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
                        child: ListView.builder(
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
                                              allProvince!.listData.length - 1
                                          ? SpaceConfig.normalSpace
                                          : 0)),
                                  child: DetailBoxCard(
                                    summaryPositive:
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .confirmedTotal),
                                    updatePositive: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .confirmedUpdate),
                                    summaryActive: NumberFormat.decimalPattern()
                                        .format(
                                            detailProvince![index].activeTotal),
                                    updateActive: "-0",
                                    summaryRecovered:
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .recoveredTotal),
                                    updateRecovered: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .recoveredUpdate),
                                    summaryDeaths: NumberFormat.decimalPattern()
                                        .format(
                                            detailProvince![index].deathsTotal),
                                    updateDeaths: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .deathsUpdate),
                                    provinceName:
                                        detailProvince![index].provinceName,
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
                                  ),
                                ),
                              );
                            } else if (detailProvince![index]
                                .provinceName
                                .trim()
                                .replaceAll(RegExp(r"\s+"), "")
                                .toLowerCase()
                                .contains(editingController.text
                                    .trim()
                                    .replaceAll(RegExp(r"\s+"), "")
                                    .toLowerCase())) {
                              return FadeInUp(
                                delay:
                                    Duration(milliseconds: isScroll ? 0 : 350),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 0,
                                    bottom: SpaceConfig.normalSpace,
                                  ),
                                  child: DetailBoxCard(
                                    summaryPositive:
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .confirmedTotal),
                                    updatePositive: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .confirmedUpdate),
                                    summaryActive: NumberFormat.decimalPattern()
                                        .format(
                                            detailProvince![index].activeTotal),
                                    updateActive: "-0",
                                    summaryRecovered:
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .recoveredTotal),
                                    updateRecovered: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .recoveredUpdate),
                                    summaryDeaths: NumberFormat.decimalPattern()
                                        .format(
                                            detailProvince![index].deathsTotal),
                                    updateDeaths: "+" +
                                        NumberFormat.decimalPattern().format(
                                            detailProvince![index]
                                                .update
                                                .deathsUpdate),
                                    provinceName:
                                        detailProvince![index].provinceName,
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
                                  ),
                                ),
                              );
                            } else {
                              return Container();
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
                  (caseTotal != null)
                      ? Text(
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
                          style: TypeTheme.smallTextFont)
                      : Shimmer.fromColors(
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
                        ),
                ],
              ),
            ),
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          (caseTotal != null)
              ? FadeInDown(
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
                )
              : FadeInDown(
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
                ),
        ],
      ),
    );
  }

  _vaccine() {
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
            builder: (context) {
              return Container(
                color: ColorTheme.bgLight,
                height: Get.height / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SpaceConfig.longSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SpaceConfig.normalSpace),
                            Text(
                              "Pelaksanaan Vaksinasi",
                              style: TypeTheme.subTitleTextFont,
                            ),
                            (localVaccine != null)
                                ? Text(
                                    "Diperbarui pada " +
                                        DateFormat.EEEE()
                                            .add_d()
                                            .add_yMMMM()
                                            .addPattern('•')
                                            .add_Hms()
                                            .format((DateTime.parse(
                                                localVaccine!.lastUpdate)))
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
                                            .replaceAll(
                                                'September', 'September')
                                            .replaceAll('October', 'Oktober')
                                            .replaceAll('November', 'November')
                                            .replaceAll('December', 'Desember'),
                                    style: TypeTheme.smallTextFont)
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 18,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  2 * SpaceConfig.longSpace) -
                                              80,
                                      decoration: BoxDecoration(
                                          color: ColorTheme.bgLight,
                                          borderRadius: BorderRadius.circular(
                                              SpaceConfig.normalSpace)),
                                    ),
                                  ),
                            SizedBox(height: SpaceConfig.longSpace),
                          ],
                        ),
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
                        child: ListView(
                          children: [
                            //NOTE: NATIONAL
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 2),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Nasional",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .firstVaccine),
                                                  cases:
                                                      "Vaksinasi Nasional Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .firstVaccine /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .totalTarget) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .firstVaccine /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .totalTarget)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .firstVaccine /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .totalTarget) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color: ColorTheme.greenColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .secondVaccine),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .secondVaccine /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .totalTarget) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .secondVaccine /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .totalTarget)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .secondVaccine /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .totalTarget) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Nasional Dosis ke-2",
                                                  color: ColorTheme.greenColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                            //NOTE: MEDICAL
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 3),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Petugas Medis",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine1Medical),
                                                  cases:
                                                      "Vaksinasi Petugas Medis Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Medical /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetMedical) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine1Medical /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetMedical)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Medical /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetMedical) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color:
                                                      ColorTheme.secondaryColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine2Medical),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Medical /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetMedical) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine2Medical /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetMedical)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Medical /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetMedical) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Petugas Medis Dosis ke-2",
                                                  color:
                                                      ColorTheme.secondaryColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                            //NOTE: OFFICER
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 4),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Petugas Publik",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine1Officer),
                                                  cases:
                                                      "Vaksinasi Petugas Publik Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Officer /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetOfficer) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine1Officer /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetOfficer)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Officer /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetOfficer) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color: ColorTheme.blueColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine2Officer),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Officer /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetOfficer) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine2Officer /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetOfficer)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Officer /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetOfficer) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Petugas Publik Dosis ke-2",
                                                  color: ColorTheme.blueColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                            //NOTE: TEEN
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 5),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Anak Remaja",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine1TeenAge),
                                                  cases:
                                                      "Vaksinasi Anak Remaja Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1TeenAge /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetTeenAge) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine1TeenAge /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetTeenAge)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1TeenAge /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetTeenAge) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color: ColorTheme.greenColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine2TeenAge),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2TeenAge /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetTeenAge) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine2TeenAge /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetTeenAge)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2TeenAge /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetTeenAge) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Anak Remaja Dosis ke-2",
                                                  color: ColorTheme.greenColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                            //NOTE: PUBLIC
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 6),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Warga Umum",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine1GeneralPublic),
                                                  cases:
                                                      "Vaksinasi Warga Umum Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1GeneralPublic /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetGeneralPublic) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine1GeneralPublic /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetGeneralPublic)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1GeneralPublic /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetGeneralPublic) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color: ColorTheme.blueColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine2GeneralPublic),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2GeneralPublic /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetGeneralPublic) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine2GeneralPublic /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetGeneralPublic)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2GeneralPublic /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetGeneralPublic) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Warga Umum Dosis ke-2",
                                                  color: ColorTheme.blueColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                            //NOTE: AGED
                            FadeInUp(
                              delay: Duration(
                                  milliseconds: isScroll ? 0 : 350 * 7),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SpaceConfig.longSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: SpaceConfig.normalSpace),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SpaceConfig.normalSpace),
                                      child: Text(
                                        "Vaksinasi Lanjut Usia",
                                        style: TypeTheme.subTitleTextFont,
                                      ),
                                    ),
                                    SizedBox(height: SpaceConfig.shortSpace),
                                    (monitoringVaccine != null)
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine1Aged),
                                                  cases:
                                                      "Vaksinasi Lanjut Usia Dosis ke-1",
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Aged /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetAged) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine1Aged /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetAged)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine1Aged /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetAged) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  color:
                                                      ColorTheme.secondaryColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  right:
                                                      SpaceConfig.normalSpace -
                                                          4,
                                                  bottom:
                                                      SpaceConfig.shortSpace,
                                                ),
                                                width: Get.width,
                                                height: 120,
                                                child: ProgressBoxCard(
                                                  icon: Icons.medication,
                                                  summary: NumberFormat
                                                          .decimalPattern()
                                                      .format(monitoringVaccine![
                                                              monitoringVaccine!
                                                                      .length -
                                                                  1]
                                                          .doneVaccine2Aged),
                                                  percent: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Aged /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetAged) >
                                                          1.0
                                                      ? 1.0
                                                      : (monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .doneVaccine2Aged /
                                                          monitoringVaccine![
                                                                  monitoringVaccine!
                                                                          .length -
                                                                      1]
                                                              .targetAged)),
                                                  update: ((monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .doneVaccine2Aged /
                                                              monitoringVaccine![
                                                                      monitoringVaccine!
                                                                              .length -
                                                                          1]
                                                                  .targetAged) *
                                                          100)
                                                      .toStringAsFixed(2),
                                                  cases:
                                                      "Vaksinasi Lanjut Usia Dosis ke-2",
                                                  color:
                                                      ColorTheme.secondaryColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Column(
                                              children:
                                                  List.generate(2, (index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: SpaceConfig
                                                            .normalSpace +
                                                        4,
                                                    left:
                                                        SpaceConfig.normalSpace,
                                                    right:
                                                        SpaceConfig.normalSpace,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              SpaceConfig
                                                                  .normalSpace),
                                                    ),
                                                    width: Get.width,
                                                    height: 120 - 4,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SpaceConfig.normalSpace),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 350 * 6),
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
                        "Target Vaksinasi",
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
                  (localVaccine != null)
                      ? Text(
                          "Diperbarui pada " +
                              DateFormat.EEEE()
                                  .add_d()
                                  .add_yMMMM()
                                  .addPattern('•')
                                  .add_Hms()
                                  .format((DateTime.parse(
                                      localVaccine!.lastUpdate)))
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
                          style: TypeTheme.smallTextFont)
                      : Shimmer.fromColors(
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
                                  SpaceConfig.normalSpace),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          (monitoringVaccine != null)
              ? FadeInDown(
                  delay: Duration(milliseconds: 350 * 7),
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
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.timelapse,
                                summary: NumberFormat.decimalPattern()
                                    .format(monitoringVaccine![0].totalTarget),
                                cases: "Total Target",
                                color: ColorTheme.blueColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.medical_services,
                                summary: NumberFormat.decimalPattern().format(
                                    monitoringVaccine![0].targetMedical),
                                cases: "Petugas Medis",
                                color: ColorTheme.greenColor,
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
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.apartment,
                                summary: NumberFormat.decimalPattern().format(
                                    monitoringVaccine![0].targetOfficer),
                                cases: "Petugas Publik",
                                color: ColorTheme.greenColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.elderly,
                                summary: NumberFormat.decimalPattern()
                                    .format(monitoringVaccine![0].targetAged),
                                cases: "Lanjut Usia",
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
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.people_sharp,
                                summary: NumberFormat.decimalPattern().format(
                                    monitoringVaccine![0].targetGeneralPublic),
                                cases: "Warga Umum",
                                color: ColorTheme.blueColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 80,
                              child: SmallBoxCard(
                                icon: Icons.accessibility_new,
                                summary: NumberFormat.decimalPattern().format(
                                    monitoringVaccine![0].targetTeenAge),
                                cases: "Anak Remaja",
                                color: ColorTheme.greenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : FadeInDown(
                  delay: Duration(milliseconds: 350 * 7),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: List.generate(3, (index) {
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
                                height: 80 - 4,
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
                                height: 80 - 4,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
        ],
      ),
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
      ],
    );
  }
}
