part of 'pages.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Ini aplikasi apa?',
      'Kenapa beritanya tidak bisa diakses?',
      'Berapa lama data kasus dan berita diperbarui?',
      'Kenapa data kasus ataupun berita tidak tampil?',
      'Bagaimana caranya mengubah lokasi?',
    ];

    List<String> subtitle = [
      'Aplikasi ini bertujuan untuk memberikan informasi terkait kasus dan berita COVID-19 di Indonesia.',
      'Untuk berita yang tidak bisa diakses, kemungkinan bahwa sumber website berita tersebut sedang bermasalah.',
      'Jumlah kasus akan diperbarui setiap hari, tetapi untuk berita diperbarui sekitar 30 menit.',
      'Data yang tidak tampil atau terlalu lama dimuat, biasanya dikarenakan sinyal yang lemah atau kecepatan internet yang lambat.',
      'Untuk mengubah lokasi pada kasus, dapat menuju ke menu kasus, lalu pilih bagian lokasi yang tersedia.',
    ];

    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ColorTheme.secondaryColor,
        leading: Container(
          margin: EdgeInsets.only(left: SpaceConfig.normalSpace),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        title: Text(
          "Pertanyaan Terkait",
          style: TypeTheme.titleTextFont.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: LayoutConfig.deviceWidth,
            height: 300,
            child: Lottie.asset('assets/images/illustration-faq.json'),
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return false;
              },
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SpaceConfig.normalSpace,
                        horizontal: SpaceConfig.normalSpace - 5,
                      ),
                      child: Icon(Icons.help),
                    ),
                    childrenPadding: EdgeInsets.symmetric(
                      vertical: SpaceConfig.shortSpace,
                      horizontal: SpaceConfig.longSpace,
                    ),
                    iconColor: Colors.black,
                    collapsedIconColor: ColorTheme.secondaryColor,
                    backgroundColor: ColorTheme.primaryColor,
                    title: Text(
                      title[index],
                      style: TypeTheme.normalTextFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    children: [
                      Text(
                        subtitle[index],
                        style: TypeTheme.normalTextFont.copyWith(
                          color: Colors.black.withOpacity(0.75),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
