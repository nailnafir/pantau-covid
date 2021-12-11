part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: PageDecoration(
            pageColor: ColorTheme.bgLight,
            titleTextStyle: TypeTheme.titleTextFont.copyWith(fontSize: 24),
            bodyTextStyle: TypeTheme.bigTextFont,
          ),
          image: Lottie.asset(
            'assets/images/news-digital.json',
            height: 250,
          ),
          title: "Berita COVID-19",
          body:
              "Melihat berita terkait COVID-19 di Indonesia yang diperbarui setiap jam",
        ),
        PageViewModel(
          decoration: PageDecoration(
            pageColor: ColorTheme.bgLight,
            titleTextStyle: TypeTheme.titleTextFont.copyWith(fontSize: 24),
            bodyTextStyle: TypeTheme.bigTextFont,
          ),
          image: Lottie.asset(
            'assets/images/data-chart.json',
            height: 250,
            width: 350,
          ),
          title: "Data COVID-19",
          body:
              "Melihat data COVID-19 di Indonesia yang diperbarui setiap harinya",
        ),
        PageViewModel(
          decoration: PageDecoration(
            pageColor: ColorTheme.bgLight,
            titleTextStyle: TypeTheme.titleTextFont.copyWith(fontSize: 24),
            bodyTextStyle: TypeTheme.bigTextFont,
          ),
          image: Lottie.asset(
            'assets/images/health-care.json',
            height: 220,
          ),
          title: "Informasi COVID-19",
          body:
              "Edukasi, gejala, pencegahan, dan semua tentang protokol kesehatan",
        ),
      ],
      onDone: () {
        Get.to(RegisterPage());
      },
      showSkipButton: true,
      color: ColorTheme.secondaryColor,
      skip: Text("Lewati", style: TypeTheme.bigTextFont),
      next: Icon(Icons.arrow_forward),
      done: Text("Selesai", style: TypeTheme.bigTextFont),
      globalBackgroundColor: ColorTheme.bgLight,
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorTheme.accentColorDarkGrey,
        activeSize: Size(24.0, 10.0),
        activeColor: ColorTheme.secondaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SpaceConfig.longSpace)),
        ),
      ),
    );
  }
}
