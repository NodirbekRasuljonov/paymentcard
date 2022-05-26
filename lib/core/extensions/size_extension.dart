import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  MediaQueryData get mq=>MediaQuery.of(this);
  double get h=>mq.size.height;
  double get w=>mq.size.width;
}