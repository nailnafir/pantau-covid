part of 'pages.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorTheme.secondaryColor,
          ),
        ),
        title: Text(
          "Pertanyaan Terkait",
          style: TypeTheme.bigTextFont.copyWith(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text("Apa"),
          ),
        ],
      ),
    );
  }
}
