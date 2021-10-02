part of 'pages.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  CaseTotalModel? caseTotal;
  LocalVaccineModel? localVaccine;
  List<MonitoringVaccine>? monitoringVaccine;
  AllProvinceModel? allProvinceModel;
  List<DetailProvinceModel>? detailProvinceModel;

  int _current = 0;

  List imgBanner = [];
  List bannerURL = [];

  @override
  void initState() {
    super.initState();

    CaseTotalModel.fetchTotal('/public/api/update.json').then((value) {
      caseTotal = value;
      setState(() {});
    });

    AllProvinceModel.fetchAll('/public/api/prov.json').then((value) {
      allProvinceModel = value;
      setState(() {});
    });

    DetailProvinceModel.fetchDetail('/public/api/prov.json').then((value) {
      detailProvinceModel = value;
      setState(() {});
    });

    LocalVaccineModel.fetchVaccine('/vaksinasi').then((value) {
      localVaccine = value;
      setState(() {});
    });

    MonitoringVaccine.fetchVaccine('/vaksinasi').then((value) {
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
      'https://covid19.go.id/berita/mekanisme-pendaftaran-vaksinasi-masyarakat-lanjut-usia-60-tahun-ke-atas',
      'https://sehatnegeriku.kemkes.go.id/baca/umum/20200125/2832840/wni-wuhan-tak-ada-terjangkit-ncov/',
      'https://linktr.ee/covid19.go.id',
    ];
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
        //NOTE: CASE
        InkWell(
          onTap: () {
            Get.bottomSheet(
              BottomSheet(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(SpaceConfig.longSpace)),
                ),
                onClosing: () {},
                builder: (context) {
                  return Container(
                    color: ColorTheme.bgLight,
                    height: MediaQuery.of(context).size.height / 2 +
                        SpaceConfig.longSpace,
                    child: Column(
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
                        Card(
                          margin: EdgeInsets.symmetric(
                            vertical: SpaceConfig.normalSpace,
                            horizontal: SpaceConfig.longSpace - 4,
                          ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace)),
                          color: Colors.white,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: ColorTheme.secondaryColor,
                                ),
                                hintText: "Temukan Provinsi...."),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: allProvinceModel!.listData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: (index == 0
                                        ? SpaceConfig.normalSpace
                                        : SpaceConfig.normalSpace),
                                    bottom: (index ==
                                            allProvinceModel!.listData.length -
                                                1
                                        ? SpaceConfig.normalSpace
                                        : 0)),
                                child: DetailBoxCard(
                                  summaryPositive: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .confirmedTotal),
                                  updatePositive: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .update
                                          .confirmedUpdate),
                                  summaryActive: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .activeTotal),
                                  updateActive: "0",
                                  summaryRecovered:
                                      NumberFormat.decimalPattern().format(
                                          detailProvinceModel![index]
                                              .recoveredTotal),
                                  updateRecovered: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .update
                                          .recoveredUpdate),
                                  summaryDeaths: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .deathsTotal),
                                  updateDeaths: NumberFormat.decimalPattern()
                                      .format(detailProvinceModel![index]
                                          .update
                                          .deathsUpdate),
                                  provinceName:
                                      detailProvinceModel![index].provinceName,
                                  lastUpdate: DateFormat.EEEE()
                                      .add_d()
                                      .add_yMMMM()
                                      .format((DateTime.parse(
                                          allProvinceModel!.lastUpdate)))
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
                              );
                            },
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
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SpaceConfig.longSpace - 4,
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SpaceConfig.normalSpace)),
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      vertical: SpaceConfig.longSpace,
                      horizontal: SpaceConfig.normalSpace,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorTheme.secondaryColor,
                        ),
                        SizedBox(width: SpaceConfig.shortSpace),
                        Text(
                          "Tangerang",
                          style: TypeTheme.subTitleTextFont,
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
                            "Lokasi Kamu",
                            style: TypeTheme.smallTextFont
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jumlah Kasus",
                          style: TypeTheme.subTitleTextFont
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Selengkapnya",
                          style: TypeTheme.smallTextFont.copyWith(
                            color: ColorTheme.secondaryColor,
                            fontWeight: FontWeight.w700,
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
                            update: "+" +
                                NumberFormat.decimalPattern()
                                    .format(caseTotal!.confirmedUpdate),
                            cases: "Positif",
                            color: ColorTheme.secondaryColor,
                          ),
                          BigBoxCard(
                            icon: Icons.remove_circle_rounded,
                            summary: NumberFormat.decimalPattern()
                                .format(caseTotal!.activeTotal),
                            update: NumberFormat.decimalPattern()
                                .format(caseTotal!.activeUpdate),
                            cases: "Dirawat",
                            color: ColorTheme.blueColor,
                          ),
                          BigBoxCard(
                            icon: Icons.change_circle_rounded,
                            summary: NumberFormat.decimalPattern()
                                .format(caseTotal!.recoveredTotal),
                            update: "+" +
                                NumberFormat.decimalPattern()
                                    .format(caseTotal!.recoveredUpdate),
                            cases: "Sembuh",
                            color: ColorTheme.greenColor,
                          ),
                          BigBoxCard(
                            icon: Icons.cancel_rounded,
                            summary: NumberFormat.decimalPattern()
                                .format(caseTotal!.deathsTotal),
                            update: "+" +
                                NumberFormat.decimalPattern()
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
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.bgLight,
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.bgLight,
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.bgLight,
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
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
                "Target Vaksinasi",
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
          height: MediaQuery.of(context).size.height / 2 -
              SpaceConfig.normalSpace * 10 +
              4,
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
                      icon: Icons.timelapse,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].totalTarget),
                      cases: "Total Target",
                      color: ColorTheme.blueColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.medical_services,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].targetMedical),
                      cases: "Tenaga Kesehatan",
                      color: ColorTheme.greenColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.apartment,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].targetOfficer),
                      cases: "Petugas Publik",
                      color: ColorTheme.greenColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.elderly,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].targetAged),
                      cases: "Lanjut Usia",
                      color: ColorTheme.blueColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.people_sharp,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].targetGeneralPublic),
                      cases: "Masyarakat Umum",
                      color: ColorTheme.blueColor,
                    ),
                    SmallBoxCard(
                      icon: Icons.accessibility_new,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].targetTeenAge),
                      cases: "Anak Remaja",
                      color: ColorTheme.greenColor,
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
                          .format(monitoringVaccine![0].firstVaccine),
                      cases: "Vaksin Dosis ke-1",
                      percent: (monitoringVaccine![0].firstVaccine /
                          monitoringVaccine![0].totalTarget),
                      update: ((monitoringVaccine![0].firstVaccine /
                                  monitoringVaccine![0].totalTarget) *
                              100)
                          .toStringAsFixed(2),
                      color: ColorTheme.secondaryColor,
                    ),
                    ProgressBoxCard(
                      icon: Icons.medication,
                      summary: NumberFormat.decimalPattern()
                          .format(monitoringVaccine![0].secondVaccine),
                      percent: (monitoringVaccine![0].secondVaccine /
                          monitoringVaccine![0].totalTarget),
                      update: ((monitoringVaccine![0].secondVaccine /
                                  monitoringVaccine![0].totalTarget) *
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
