part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({Key? key, required this.initialPage}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
            ),
            title: Text(
              "Konfirmasi",
              style: TypeTheme.subTitleTextFont,
            ),
            content: Text(
              "Yakin mau keluar aplikasi?",
              style: TypeTheme.normalTextFont,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Tidak",
                  style: TypeTheme.normalTextFont
                      .copyWith(color: ColorTheme.greenColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false); // tidak keluar
                },
              ),
              TextButton(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SpaceConfig.shortSpace),
                    color: ColorTheme.redColor,
                  ),
                  child: Text(
                    "Keluar",
                    style:
                        TypeTheme.normalTextFont.copyWith(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  // Navigator.pop(context); // keluar
                  // Navigator.pop(context, true);
                  SystemNavigator.pop(animated: true);
                },
              ),
            ],
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorTheme.secondaryColor,
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: [
              HomePage(),
              DataPage(),
              NewsPage(),
              SupportPage(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: ColorTheme.primaryColor,
          backgroundColor: ColorTheme.bgLight,
          height: 50,
          items: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.article,
              size: 30,
            ),
            Icon(
              Icons.ballot,
              size: 30,
            ),
            Icon(
              Icons.help_center,
              size: 30,
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
            _pageController.jumpToPage(_selectedPage);
          },
        ),
      ),
    );
  }
}
