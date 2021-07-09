part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.to(MainPage(initialPage: 0));
    });

    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo-pantau-covid.png"),
                ),
              ),
            ),
            Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "Pantau Covid-19",
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
