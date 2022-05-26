import 'package:flutter/material.dart';
import 'package:paymentcard/screens/selectimage/view/home_view.dart';

class AppRoutes{
  Route? onGenerateRoute(RouteSettings s){
    var args=s.arguments;
    switch (s.name) {
      case '/homeview':
        return MaterialPageRoute(builder: (context)=>SelectImage(),);
    }
  }
}