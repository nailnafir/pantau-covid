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
    return Scaffold(
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
            CasesPage(),
            NewsPage(),
            SupportPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Kasus",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Berita",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center),
            label: "Bantuan",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: TypeTheme.normalTextFont.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        unselectedLabelStyle: TypeTheme.normalTextFont.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        selectedItemColor: ColorTheme.secondaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPage,
        elevation: 2,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
          _pageController.jumpToPage(_selectedPage);
        },
      ),
    );
  }
}
