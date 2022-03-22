part of 'pages.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextEditingController editingController = TextEditingController();

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
          color: ColorTheme.secondaryColor,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1), () {
              context.read<LocationBloc>().add(LoadingLocation());
              context.read<CaseTotalBloc>().add(LoadingCaseTotal());
              context.read<CaseProvinceBloc>().add(LoadingCaseProvince());
              context.read<CheckBloc>().add(LoadingCheck());
              context.read<VaccineBloc>().add(LoadingVaccine());

              context.read<LocationBloc>().add(FetchLocation());
              context.read<CaseTotalBloc>().add(FetchCaseTotal());
              context.read<CaseProvinceBloc>().add(FetchCaseProvince());
              context.read<CheckBloc>().add(FetchCheck());
              context.read<VaccineBloc>().add(FetchVaccine());
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
        Card(
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
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    if (state is LocationLoaded) {
                      LocationModel location = state.location;
                      return Container(
                        width: Get.width / 1.75,
                        child: Text(
                          location.address,
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
                              width: Get.width - (2 * SpaceConfig.longSpace),
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
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: ColorTheme.secondaryColor,
                                    ),
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
                        child: BlocBuilder<CaseProvinceBloc, CaseProvinceState>(
                          builder: (context, state) {
                            if (state is CaseProvinceLoaded) {
                              CaseProvinceModel caseProvince =
                                  state.caseProvince;
                              return ListView.builder(
                                itemCount: caseProvince.listData.length,
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
                                                    caseProvince
                                                            .listData.length -
                                                        1
                                                ? SpaceConfig.normalSpace
                                                : 0)),
                                        child: DetailBoxCard(
                                          summaryPositive:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .confirmedTotal),
                                          updatePositive: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .confirmedUpdate),
                                          summaryActive:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .activeTotal),
                                          updateActive: "-0",
                                          summaryRecovered:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .recoveredTotal),
                                          updateRecovered: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .recoveredUpdate),
                                          summaryDeaths:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .deathsTotal),
                                          updateDeaths: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .deathsUpdate),
                                          provinceName: caseProvince
                                              .listData[index].provinceName,
                                          lastUpdate: DateFormat.EEEE()
                                              .add_d()
                                              .add_yMMMM()
                                              .format((DateTime.parse(
                                                  caseProvince.lastUpdate)))
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
                                  } else if (caseProvince
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
                                                    caseProvince
                                                            .listData.length -
                                                        1
                                                ? SpaceConfig.normalSpace
                                                : 0)),
                                        child: DetailBoxCard(
                                          summaryPositive:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .confirmedTotal),
                                          updatePositive: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .confirmedUpdate),
                                          summaryActive:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .activeTotal),
                                          updateActive: "-0",
                                          summaryRecovered:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .recoveredTotal),
                                          updateRecovered: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .recoveredUpdate),
                                          summaryDeaths:
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .deathsTotal),
                                          updateDeaths: "+" +
                                              NumberFormat.decimalPattern()
                                                  .format(caseProvince
                                                      .listData[index]
                                                      .update
                                                      .deathsUpdate),
                                          provinceName: caseProvince
                                              .listData[index].provinceName,
                                          lastUpdate: DateFormat.EEEE()
                                              .add_d()
                                              .add_yMMMM()
                                              .format((DateTime.parse(
                                                  caseProvince.lastUpdate)))
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
                                    return ShimmerLoading(
                                      width: MediaQuery.of(context).size.width,
                                      height: 120,
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
            BlocBuilder<CaseTotalBloc, CaseTotalState>(
              builder: (context, state) {
                if (state is CaseTotalLoaded) {
                  CaseTotalModel? caseTotal = state.caseTotal;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Diperbarui pada " +
                              DateFormat.EEEE()
                                  .add_d()
                                  .add_yMMMM()
                                  .addPattern('•')
                                  .add_Hms()
                                  .format(
                                      (DateTime.parse(caseTotal.lastUpdate)))
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
                          style: TypeTheme.smallTextFont),
                      SizedBox(height: SpaceConfig.normalSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: Icons.add_circle_rounded,
                              iconSize: 100,
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace - 2),
                              summary: NumberFormat.decimalPattern()
                                  .format(caseTotal.confirmedTotal),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(caseTotal.confirmedUpdate),
                              cases: "Positif",
                              color: ColorTheme.secondaryColor,
                            ),
                          ),
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: Icons.remove_circle_rounded,
                              iconSize: 100,
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace - 2),
                              summary: NumberFormat.decimalPattern()
                                  .format(caseTotal.activeTotal),
                              update: NumberFormat.decimalPattern()
                                  .format(caseTotal.activeUpdate),
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
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: Icons.change_circle_rounded,
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace - 2),
                              iconSize: 100,
                              summary: NumberFormat.decimalPattern()
                                  .format(caseTotal.recoveredTotal),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(caseTotal.recoveredUpdate),
                              cases: "Sembuh",
                              color: ColorTheme.greenColor,
                            ),
                          ),
                          Container(
                            width: (Get.width - 2 * SpaceConfig.longSpace) / 2,
                            height: 120,
                            child: BigBoxCard(
                              icon: Icons.cancel_rounded,
                              iconSize: 100,
                              margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace - 2),
                              summary: NumberFormat.decimalPattern()
                                  .format(caseTotal.deathsTotal),
                              update: "+" +
                                  NumberFormat.decimalPattern()
                                      .format(caseTotal.deathsUpdate),
                              cases: "Meninggal",
                              color: ColorTheme.redColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoading(
                        width: MediaQuery.of(context).size.width -
                            (SpaceConfig.longSpace * 4),
                        height: 14,
                        margin: EdgeInsets.only(
                          top: SpaceConfig.shortSpace / 2,
                          bottom: SpaceConfig.normalSpace,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerLoading(
                            width:
                                (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                            height: 120,
                          ),
                          ShimmerLoading(
                            width:
                                (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                            height: 120,
                          ),
                        ],
                      ),
                      SizedBox(height: SpaceConfig.normalSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerLoading(
                            width:
                                (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                            height: 120,
                          ),
                          ShimmerLoading(
                            width:
                                (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                            height: 120,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _vaccine() {
    return Column(
      children: [
        Container(
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
              BlocBuilder<VaccineBloc, VaccineState>(
                builder: (context, state) {
                  if (state is VaccineLoaded) {
                    VaccineModel? vaccine = state.vaccine;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Diperbarui pada " +
                                DateFormat.EEEE()
                                    .add_d()
                                    .add_yMMMM()
                                    .addPattern('•')
                                    .add_Hms()
                                    .format(
                                        (DateTime.parse(vaccine.lastUpdate)))
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
                            style: TypeTheme.smallTextFont),
                        SizedBox(height: SpaceConfig.normalSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: FontAwesomeIcons.syringe,
                                iconSize: 80,
                                margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace + 6,
                                  bottom: SpaceConfig.shortSpace,
                                ),
                                summary: NumberFormat.decimalPattern()
                                    .format(vaccine.totalVaccineFirst),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(vaccine.updateVaccineFirst),
                                cases: "Dosis Pertama",
                                color: ColorTheme.blueColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: FontAwesomeIcons.syringe,
                                iconSize: 80,
                                margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace + 6,
                                  bottom: SpaceConfig.shortSpace,
                                ),
                                summary: NumberFormat.decimalPattern()
                                    .format(vaccine.totalVaccineSecond),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(vaccine.updateVaccineSecond),
                                cases: "Dosis Kedua",
                                color: ColorTheme.greenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerLoading(
                          width: MediaQuery.of(context).size.width -
                              (SpaceConfig.longSpace * 4),
                          height: 14,
                          margin: EdgeInsets.only(
                            top: SpaceConfig.shortSpace / 2,
                            bottom: SpaceConfig.normalSpace,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerLoading(
                              width:
                                  (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                              height: 120,
                            ),
                            ShimmerLoading(
                              width:
                                  (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                              height: 120,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  _check() {
    return Column(
      children: [
        Container(
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
              BlocBuilder<CheckBloc, CheckState>(
                builder: (context, state) {
                  if (state is CheckLoaded) {
                    CheckModel? check = state.check;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Diperbarui pada " +
                                DateFormat.EEEE()
                                    .add_d()
                                    .add_yMMMM()
                                    .addPattern('•')
                                    .add_Hms()
                                    .format((DateTime.parse(check.lastUpdate)))
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
                            style: TypeTheme.smallTextFont),
                        SizedBox(height: SpaceConfig.normalSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: FontAwesomeIcons.vial,
                                iconSize: 80,
                                margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace + 6,
                                  bottom: SpaceConfig.shortSpace,
                                ),
                                summary: NumberFormat.decimalPattern()
                                    .format(check.totalPeoplePcr),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(check.updatePeoplePcr),
                                cases: "Tes PCR",
                                color: ColorTheme.greenColor,
                              ),
                            ),
                            Container(
                              width:
                                  (Get.width - 2 * SpaceConfig.longSpace) / 2,
                              height: 120,
                              child: BigBoxCard(
                                icon: FontAwesomeIcons.vial,
                                iconSize: 80,
                                margin: EdgeInsets.only(
                                  right: SpaceConfig.shortSpace + 6,
                                  bottom: SpaceConfig.shortSpace,
                                ),
                                summary: NumberFormat.decimalPattern()
                                    .format(check.totalPeopleAntigen),
                                update: "+" +
                                    NumberFormat.decimalPattern()
                                        .format(check.updatePeopleAntigen),
                                cases: "Tes Antigen",
                                color: ColorTheme.blueColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerLoading(
                          width: MediaQuery.of(context).size.width -
                              (SpaceConfig.longSpace * 4),
                          height: 14,
                          margin: EdgeInsets.only(
                            top: SpaceConfig.shortSpace / 2,
                            bottom: SpaceConfig.normalSpace,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerLoading(
                              width:
                                  (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                              height: 120,
                            ),
                            ShimmerLoading(
                              width:
                                  (Get.width - 2.5 * SpaceConfig.longSpace) / 2,
                              height: 120,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  _map() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Text(
            "Peta Sebaran",
            style: TypeTheme.subTitleTextFont,
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
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
        SizedBox(height: SpaceConfig.normalSpace),
      ],
    );
  }
}
