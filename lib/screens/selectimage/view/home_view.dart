import 'dart:io';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcard/core/extensions/size_extension.dart';
import 'package:paymentcard/screens/selectimage/cubit/home_cubit.dart';
import 'package:paymentcard/screens/selectimage/state/home_state.dart';
import 'package:paymentcard/widgets/draggable_widget.dart';
import 'package:blur/blur.dart';

class SelectImage extends StatelessWidget {
  SelectImage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MyCreditCardCubit, MyCreditCardState>(
        builder: (context, state) {
          return myBody(context);
        },
        listener: (context, state) {},
      ),
    );
  }

  SizedBox myBody(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.h,
      child: Stack(
        children: [
          Positioned(
            top: context.h * 0.07,
            left: context.h * 0.02,
            right: context.h * 0.02,
            child: DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return CreditCard(
                  cardNumber: '',
                  cardHolderName: '',
                  backBackground: context
                          .watch<MyCreditCardCubit>()
                          .controlimages
                      ? Image.file(
                          File(
                            context.watch<MyCreditCardCubit>().image!.path,
                          ),
                        )
                      : Image.asset(context.watch<MyCreditCardCubit>().imgurl)
                          .blurred(
                          blur: context.watch<MyCreditCardCubit>().blurValue,
                          blurColor: Colors.transparent,
                          colorOpacity: 0.0,
                        ),
                  // ? change the background image using from a device or default images given
                  frontBackground: Image.asset(
                    context.watch<MyCreditCardCubit>().imgurl,
                  ).blurred(
                    blur: context.watch<MyCreditCardCubit>().blurValue,
                    blurColor: Colors.transparent,
                    colorOpacity: 0.0,
                  ),
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                context.read<MyCreditCardCubit>().changeImage(data: data);
              },
            ),
          ),
          Positioned(
            top: context.h * 0.35,
            left: context.h * 0.01,
            right: context.h * 0.01,
            child: SizedBox(
              height: context.h * 0.2,
              width: context.h * 0.25,
              child: MydraggableWidget(),
            ),
          ),
          Positioned(
            top: context.h * 0.54,
            left: context.h * 0.025,
            right: context.h * 0.025,
            child: Row(
              children: [
                const Text(
                  'Blur',
                  style: TextStyle(fontSize: 30.0),
                ),
                Slider(
                  max: 5.0,
                  value: context.watch<MyCreditCardCubit>().blurValue,
                  onChanged: (data) {
                    context.read<MyCreditCardCubit>().changeBLur(data: data);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: context.h * 0.6,
            left: context.h * 0.02,
            child: TextButton(
              onPressed: () async {
                context.read<MyCreditCardCubit>().control();
                context.read<MyCreditCardCubit>().uploadImage();
              },
              child: const Text(
                "Choose from gallery",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Positioned(
            left: context.h*0.02,
            right: context.h*0.02,
            bottom: context.h*0.1,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(context.h*0.3, context.h*0.07)
              ),              onPressed: () {
                Navigator.pushNamed(context, '/inputview');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text('Next',style: TextStyle(fontSize: 18.0),),
                  SizedBox(width: 5.0,),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 28.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
