part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isNameFilled = false;
  bool isEmailValid = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", nameController.text);
    pref.setString("email", emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorTheme.primaryColor,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: -130,
              left: -130,
              child: FadeInLeft(
                child: Bubble(
                  color: ColorTheme.secondaryColor,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -50,
              child: FadeInRight(
                child: Bubble(
                  color: ColorTheme.secondaryColor,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              bottom: -130,
              right: -130,
              child: FadeInRight(
                child: Bubble(
                  color: ColorTheme.secondaryColor,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: -50,
              child: FadeInLeft(
                child: Bubble(
                  color: ColorTheme.secondaryColor,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInDown(
                      delay: const Duration(milliseconds: 350 * 2),
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/image-register.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SpaceConfig.longSpace),
                    FadeInUp(
                      delay: const Duration(milliseconds: 350 * 2),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            horizontal: SpaceConfig.longSpace),
                        child: TextFormField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.name,
                          style: TypeTheme.normalTextFont,
                          onChanged: (text) {
                            setState(() {
                              isNameFilled = text.length >= 4;
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      SpaceConfig.normalSpace)),
                              labelText: "Nama Panggilan"),
                        ),
                      ),
                    ),
                    SizedBox(height: SpaceConfig.longSpace),
                    FadeInUp(
                      delay: const Duration(milliseconds: 350 * 2),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            horizontal: SpaceConfig.longSpace),
                        child: TextFormField(
                          controller: emailController,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.emailAddress,
                          style: TypeTheme.normalTextFont
                              .copyWith(color: ColorTheme.bgDark),
                          onChanged: (text) {
                            setState(() {
                              isEmailValid = EmailValidator.validate(text);
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SpaceConfig.normalSpace)),
                            labelText: "Alamat Email",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2 * SpaceConfig.longSpace),
                    FadeInUp(
                      delay: const Duration(milliseconds: 350 * 2),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * SpaceConfig.longSpace,
                        height: 50,
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: (isNameFilled && isEmailValid)
                              ? ColorTheme.bgDark
                              : ColorTheme.bgDark.withOpacity(0.35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SpaceConfig.normalSpace)),
                          onPressed: () {
                            if (isNameFilled && isEmailValid) {
                              saveData();
                              Navigator.popAndPushNamed(context, "/main");
                            } else {
                              var snackBar = SnackBar(
                                content: Text(
                                  "Mohon isi data dengan benar",
                                  style: TypeTheme.normalTextFont,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text("Masuk", style: TypeTheme.bigTextFont),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
