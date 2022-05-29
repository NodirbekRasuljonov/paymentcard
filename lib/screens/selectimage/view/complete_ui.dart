import 'dart:io';

import 'package:awesome_card/awesome_card.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcard/screens/selectimage/cubit/home_cubit.dart';
import 'package:paymentcard/screens/selectimage/state/home_state.dart';

class CompleteUI extends StatelessWidget {
  const CompleteUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MyCreditCardCubit, MyCreditCardState>(
      builder: (context, state) {
        return completeUIbody(context);
      },
      listener: (context, state) {},
    ));
  }

  Center completeUIbody(BuildContext context) {
    return Center(
      child: CreditCard(
        cardExpiry: context.watch<MyCreditCardCubit>().exipryController.text,
        cardNumber:
            context.watch<MyCreditCardCubit>().cardnumberController.text,
        cardHolderName: context.watch<MyCreditCardCubit>().cardholder.text,
        frontBackground: context.watch<MyCreditCardCubit>().controlimages
            ? Image.file(
                File(
                  context.watch<MyCreditCardCubit>().image!.path,
                ),
              )
            : Image.asset(
                context.watch<MyCreditCardCubit>().imgurl,
              ).blurred(
                blur: context.watch<MyCreditCardCubit>().blurValue,
                blurColor: Colors.transparent,
                colorOpacity: 0.0,
              ),
        backBackground: context.watch<MyCreditCardCubit>().controlimages
            ? Image.file(
                File(
                  context.watch<MyCreditCardCubit>().image!.path,
                ),
              )
            : Image.asset(
                context.watch<MyCreditCardCubit>().imgurl,
              ).blurred(
                blur: context.watch<MyCreditCardCubit>().blurValue,
                blurColor: Colors.transparent,
                colorOpacity: 0.0,
              ),
      ),
    );
  }
}
