part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<String?> loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("name") ?? null;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      loadData().then((name) {
        Get.offAll(
            (name == null) ? OnBoardingPage() : MainPage(initialPage: 0));
      });
    });

    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ZoomIn(
              duration: Duration(milliseconds: 800),
              child: Container(
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo-pantau-covid.png"),
                  ),
                ),
              ),
            ),
            Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "PANTAU COVID-19",
                    speed: Duration(milliseconds: 100),
                    textStyle: TypeTheme.titleTextFont.copyWith(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 30,
                    ),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
