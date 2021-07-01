part of 'pages.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key}) : super(key: key);

  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  int _current = 0;

  List imgBanner = [
    "assets/images/banner-one.jpg",
    "assets/images/banner-two.jpg",
    "assets/images/banner-three.jpg",
    "assets/images/banner-four.jpg",
  ];

  List<String> location = [];
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
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
        child: Container(
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
              Text("Diperbarui pada 28 Juni 2021 10:00",
                  style: TypeTheme.smallTextFont),
            ],
          ),
        ),
        SizedBox(height: SpaceConfig.normalSpace),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SpaceConfig.longSpace - 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxCard(
                icon: Icons.add_circle_rounded,
                summary: "380",
                cases: "Positif",
                color: ColorTheme.secondaryColor,
              ),
              BoxCard(
                icon: Icons.change_circle_rounded,
                summary: "100",
                cases: "Sembuh",
                color: ColorTheme.greenColor,
              ),
              BoxCard(
                icon: Icons.cancel_rounded,
                summary: "50",
                cases: "Meninggal",
                color: ColorTheme.redColor,
              ),
            ],
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
