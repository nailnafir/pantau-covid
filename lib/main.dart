import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pantau_covid/bloc/blocs.dart';
import 'package:flutter_pantau_covid/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocationBloc()..add(FetchLocation())),
        BlocProvider(
            create: (context) => CaseTotalBloc()..add(FetchCaseTotal())),
        BlocProvider(
            create: (context) => CaseProvinceBloc()..add(FetchCaseProvince())),
        BlocProvider(create: (context) => VaccineBloc()..add(FetchVaccine())),
        BlocProvider(create: (context) => CheckBloc()..add(FetchCheck())),
        BlocProvider(create: (context) => NewsBloc()..add(FetchNews())),
      ],
      child: MaterialApp(
        home: const SplashPage(),
        initialRoute: '/',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/register': (context) => const RegisterPage(),
          '/definition': (context) => const DefinitionPage(),
          '/prevention': (context) => const PreventionPage(),
          '/symptom': (context) => const SymptompPage(),
          '/main': (context) => const MainPage(initialPage: 0),
          '/faq': (context) => const FaqPage(),
          '/about': (context) => const AboutPage(),
          '/support': (context) => const SupportPage(),
        },
      ),
    );
  }
}
