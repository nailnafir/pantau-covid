part of 'pages.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key}) : super(key: key);

  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  CaseTotalModel? caseTotal;
  LocalVaccineModel? localVaccine;

  int _current = 0;

  List imgBanner = [];

  List<String> location = [];
  String? selectedLocation;

  @override
  void initState() {
    super.initState();

    CaseTotalModel.fetchTotal('/public/api/update.json').then((value) {
      caseTotal = value;
      setState(() {});
    });

    LocalVaccineModel.fetchVaccine('/api/vaksin').then((value) {
      localVaccine = value;
      setState(() {});
    });

    imgBanner = [
      'assets/images/banner-one.jpg',
      'assets/images/banner-two.jpg',
      'assets/images/banner-three.jpg',
      'assets/images/banner-four.jpg',
    ];

    location = [
      'Indonesia',
      'DKI Jakarta',
      'Jawa Barat',
      'Jawa Tengah',
      'Jawa Timur',
    ];

    selectedLocation = location[0];
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
    return Container(
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
              width: LayoutConfig.deviceWidth,
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
    );
  }

  _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace - 4,
          ),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SpaceConfig.normalSpace)),
            child: Stack(
              children: [
                Container(
                  width: LayoutConfig.deviceWidth,
                  padding: EdgeInsets.fromLTRB(
                    SpaceConfig.longSpace * 2,
                    SpaceConfig.normalSpace,
                    SpaceConfig.normalSpace,
                    SpaceConfig.normalSpace,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(SpaceConfig.normalSpace),
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    style: TypeTheme.bigTextFont.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    isExpanded: true,
                    elevation: 1,
                    value: selectedLocation,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: ColorTheme.secondaryColor,
                      size: 30,
                    ),
                    items: location.map((i) {
                      return DropdownMenuItem(value: i, child: Text(i));
                    }).toList(),
                    onChanged: (String? item) {
                      setState(() {
                        selectedLocation = item;
                        Get.rawSnackbar(
                          titleText: Text(
                            "Maaf ya",
                            style: TypeTheme.bigTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          messageText: Text(
                            "Fitur sedang dalam perbaikan",
                            style: TypeTheme.normalTextFont.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          backgroundColor: ColorTheme.redColor,
                          duration: Duration(seconds: 3),
                          padding: EdgeInsets.symmetric(
                            horizontal: SpaceConfig.longSpace,
                            vertical: SpaceConfig.normalSpace,
                          ),
                          icon: Icon(
                            Icons.build_circle,
                            color: Colors.white,
                          ),
                          snackPosition: SnackPosition.TOP,
                        );
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SpaceConfig.longSpace,
                    horizontal: SpaceConfig.normalSpace,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: ColorTheme.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.longSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah Kasus",
                style: TypeTheme.subTitleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              (caseTotal != null)
                  ? Text(
                      "Diperbarui pada " +
                          DateFormat.EEEE()
                              .add_d()
                              .add_yMMMM()
                              .addPattern('•')
                              .add_Hms()
                              .format((DateTime.parse(caseTotal!.lastUpdate)))
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
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
          height: MediaQuery.of(context).size.height / 3 -
              SpaceConfig.longSpace +
              2,
          child: (caseTotal != null)
              ? GridView.count(
                  padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  crossAxisSpacing: SpaceConfig.shortSpace,
                  mainAxisSpacing: SpaceConfig.shortSpace,
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                  primary: false,
                  children: [
                    BigBoxCard(
                      icon: Icons.add_circle_rounded,
                      summary: NumberFormat.decimalPattern()
                          .format(caseTotal!.confirmedTotal),
                      update: NumberFormat.decimalPattern()
                          .format(caseTotal!.confirmedUpdate),
                      cases: "Positif",
                      color: ColorTheme.secondaryColor,
                    ),
                    BigBoxCard(
                      icon: Icons.remove_circle_rounded,
                      summary: NumberFormat.decimalPattern()
                          .format(caseTotal!.recoveredTotal),
                      update: NumberFormat.decimalPattern()
                          .format(caseTotal!.recoveredUpdate),
                      cases: "Dirawat",
                      color: ColorTheme.blueColor,
                    ),
                    BigBoxCard(
                      icon: Icons.change_circle_rounded,
                      summary: NumberFormat.decimalPattern()
                          .format(caseTotal!.recoveredTotal),
                      update: NumberFormat.decimalPattern()
                          .format(caseTotal!.recoveredUpdate),
                      cases: "Sembuh",
                      color: ColorTheme.greenColor,
                    ),
                    BigBoxCard(
                      icon: Icons.cancel_rounded,
                      summary: NumberFormat.decimalPattern()
                          .format(caseTotal!.deathsTotal),
                      update: NumberFormat.decimalPattern()
                          .format(caseTotal!.deathsUpdate),
                      cases: "Meninggal",
                      color: ColorTheme.redColor,
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(
                        horizontal: SpaceConfig.longSpace, vertical: 2),
                    crossAxisSpacing: SpaceConfig.normalSpace,
                    mainAxisSpacing: SpaceConfig.normalSpace,
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    primary: false,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ],
                  ),
                ),
        ),
        SizedBox(height: SpaceConfig.longSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah Target Vaksinasi",
                style: TypeTheme.subTitleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              (localVaccine != null)
                  ? Text(
                      "Diperbarui pada " +
                          DateFormat.EEEE()
                              .add_d()
                              .add_yMMMM()
                              .addPattern('•')
                              .add_Hms()
                              .format(
                                  (DateTime.parse(localVaccine!.lastUpdate)))
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
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
          height: MediaQuery.of(context).size.height / 4 -
              SpaceConfig.normalSpace -
              2,
          child: (localVaccine != null)
              ? GridView.count(
                  padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  crossAxisSpacing: SpaceConfig.shortSpace,
                  mainAxisSpacing: SpaceConfig.shortSpace,
                  childAspectRatio: 2.0,
                  crossAxisCount: 2,
                  primary: false,
                  children: [
                    SmallBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.totalTarget),
                      cases: "Total Target",
                      color: ColorTheme.blueColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.targetMedical),
                      cases: "Tenaga Kesehatan",
                      color: ColorTheme.greenColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.targetOfficer),
                      cases: "Petugas Publik",
                      color: ColorTheme.greenColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.targetAged),
                      cases: "Lanjut Usia",
                      color: ColorTheme.blueColor,
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace,
                      vertical: 1,
                    ),
                    crossAxisSpacing: SpaceConfig.normalSpace,
                    mainAxisSpacing: SpaceConfig.normalSpace,
                    childAspectRatio: 2.0,
                    crossAxisCount: 2,
                    primary: false,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ],
                  ),
                ),
        ),
        SizedBox(height: SpaceConfig.longSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pelaksanaan Vaksinasi",
                style: TypeTheme.subTitleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              (localVaccine != null)
                  ? Text(
                      "Diperbarui pada " +
                          DateFormat.EEEE()
                              .add_d()
                              .add_yMMMM()
                              .addPattern('•')
                              .add_Hms()
                              .format(
                                  (DateTime.parse(localVaccine!.lastUpdate)))
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
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
          height: MediaQuery.of(context).size.height / 3 -
              SpaceConfig.normalSpace -
              4,
          child: (localVaccine != null)
              ? GridView.count(
                  padding: EdgeInsets.symmetric(
                      horizontal: SpaceConfig.longSpace - 4),
                  crossAxisSpacing: SpaceConfig.shortSpace,
                  mainAxisSpacing: SpaceConfig.shortSpace,
                  childAspectRatio: 3.0,
                  crossAxisCount: 1,
                  primary: false,
                  children: [
                    ProgressBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.firstVaccine),
                      cases: "Vaksin Dosis ke-1",
                      percent: (localVaccine!.firstVaccine /
                          localVaccine!.totalTarget),
                      update: ((localVaccine!.firstVaccine /
                                  localVaccine!.totalTarget) *
                              100)
                          .toStringAsFixed(2),
                      color: ColorTheme.secondaryColor,
                    ),
                    ProgressBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(localVaccine!.secondVaccine),
                      percent: (localVaccine!.secondVaccine /
                          localVaccine!.totalTarget),
                      update: ((localVaccine!.secondVaccine /
                                  localVaccine!.totalTarget) *
                              100)
                          .toStringAsFixed(2),
                      cases: "Vaksin Dosis ke-2",
                      color: ColorTheme.secondaryColor,
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(
                        horizontal: SpaceConfig.longSpace, vertical: 1),
                    crossAxisSpacing: SpaceConfig.normalSpace,
                    mainAxisSpacing: SpaceConfig.normalSpace,
                    childAspectRatio: 3.0,
                    crossAxisCount: 1,
                    primary: false,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.bgLight,
                            borderRadius:
                                BorderRadius.circular(SpaceConfig.normalSpace)),
                      ),
                    ],
                  ),
                ),
        ),
        SizedBox(height: SpaceConfig.longSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace,
          ),
          child: Text(
            "Peta Sebaran",
            style: TypeTheme.subTitleTextFont
                .copyWith(fontWeight: FontWeight.w600),
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
                width: LayoutConfig.deviceWidth,
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
