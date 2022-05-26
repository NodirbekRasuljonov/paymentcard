import 'package:flutter/material.dart';
import 'package:paymentcard/routes/app_routes.dart';


void main(List<String> args) {
  runApp(const MyApp(),);
  
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes=AppRoutes();
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData.light(),
      title: 'PaymentCard',
      onGenerateRoute: appRoutes.onGenerateRoute,
      initialRoute: '/homeview',

    );
  }
}