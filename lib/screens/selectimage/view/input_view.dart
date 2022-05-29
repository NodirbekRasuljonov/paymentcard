import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paymentcard/core/extensions/size_extension.dart';
import 'package:paymentcard/screens/selectimage/cubit/home_cubit.dart';
import 'package:paymentcard/screens/selectimage/state/home_state.dart';
import 'dart:io';
import 'package:blur/blur.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<MyCreditCardCubit, MyCreditCardState>(
        builder: (context, state) {
          return inputBody(context);
        },
        listener: (context, state) {},
      ),
    );
  }

  Container inputBody(BuildContext context) => Container(
        height: context.h,
        width: context.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
              ),
              CreditCard(
                cardExpiry: context.watch<MyCreditCardCubit>().exipryController.text,
                cardNumber: context
                    .watch<MyCreditCardCubit>()
                    .cardnumberController
                    .text,
                cardHolderName:
                    context.watch<MyCreditCardCubit>().cardholder.text,
                frontBackground:
                    context.watch<MyCreditCardCubit>().controlimages
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
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: context
                          .watch<MyCreditCardCubit>()
                          .cardnumberController,
                      decoration: InputDecoration(hintText: 'Card Number'),
                      maxLength: 16,
                      onChanged: (value) {
                        BlocProvider.of<MyCreditCardCubit>(context,listen: false).cardnumberController ==
                            value;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller:
                          context.read<MyCreditCardCubit>().exipryController,
                      decoration: InputDecoration(hintText: 'Card Expiry'),
                      maxLength: 5,
                      onChanged: (value) {
                        BlocProvider.of<MyCreditCardCubit>(context,listen: false).exipryController ==
                            value;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: context.watch<MyCreditCardCubit>().cardholder,
                      decoration: InputDecoration(hintText: 'Card Holder Name'),
                      onChanged: (value) {
                        BlocProvider.of<MyCreditCardCubit>(context,listen: false).cardholder ==
                            value;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'CVV'),
                      maxLength: 3,
                      controller:
                          context.watch<MyCreditCardCubit>().cvvcontroller,
                      onChanged: (value) {
                         BlocProvider.of<MyCreditCardCubit>(context,listen: false).cvvcontroller ==
                            value;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(context.h * 0.3, context.h * 0.07),
                ),
                onPressed: ()async {
                 await context.read<MyCreditCardCubit>().saveData();
                  debugPrint("sasqlandi");
                  Navigator.pushNamed(context, '/complete');
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      );
}
