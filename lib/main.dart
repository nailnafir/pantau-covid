import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pantau_covid/bloc/blocs.dart';
import 'package:flutter_pantau_covid/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
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
      child: GetMaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
