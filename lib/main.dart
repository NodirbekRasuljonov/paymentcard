import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paymentcard/model/card_model.dart';
import 'package:paymentcard/routes/app_routes.dart';
import 'package:paymentcard/screens/selectimage/cubit/home_cubit.dart';

void main(List<String> args)async {
  await Hive.initFlutter();
  Hive.registerAdapter(CreditCardModelAdapter());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyCreditCardCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'PaymentCard',
      onGenerateRoute: appRoutes.onGenerateRoute,
      initialRoute: '/homeview',
    );
  }
}
