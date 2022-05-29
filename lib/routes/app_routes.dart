import 'package:flutter/material.dart';
import 'package:paymentcard/screens/selectimage/view/complete_ui.dart';
import 'package:paymentcard/screens/selectimage/view/input_view.dart';
import 'package:paymentcard/screens/selectimage/view/home_view.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/homeview':
        return MaterialPageRoute(
          builder: (context) => SelectImage(),
        );
        case '/inputview':
        return MaterialPageRoute(
          builder: (context) => InputView(),
        );
         case '/complete':
        return MaterialPageRoute(
          builder: (context) => CompleteUI(),
        );
    }
  }
}
