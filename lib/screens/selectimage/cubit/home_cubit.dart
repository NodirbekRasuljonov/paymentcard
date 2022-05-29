import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paymentcard/core/data/images_data.dart';
import 'package:paymentcard/model/card_model.dart';
import 'package:paymentcard/screens/selectimage/state/home_state.dart';
import 'dart:math' as math;

class MyCreditCardCubit extends Cubit<MyCreditCardState> {
  MyCreditCardCubit() : super(MyCreditCardInitialState());

  XFile? image;
  final _picker = ImagePicker();

  String imgurl = ImagesData.allimages[0];
  double blurValue = 0.0;
  var newstr = '';

  bool controlimages = false;
  TextEditingController cvvcontroller = TextEditingController();
  TextEditingController exipryController = TextEditingController();
  TextEditingController cardnumberController = TextEditingController();
  TextEditingController cardholder = TextEditingController();
  void changeImage({required String data}) {
    imgurl = data;

    emit(
      MyCreditCardInitialState(),
    );
  }

  void changeBLur({required data}) {
    blurValue = data;
    emit(
      MyCreditCardInitialState(),
    );
  }

  void uploadImage() async {
    image = (await _picker.pickImage(source: ImageSource.gallery))!;
    emit(MyCreditCardInitialState());
  }

  void control() {
    controlimages = true;
    emit(
      MyCreditCardInitialState(),
    );
  }

  void cardnumberChange(
      {required value, required TextEditingController controller}) {
    controller.text = value;
    emit(
      MyCreditCardInitialState(),
    );
  }

  Future saveData() async {
    emit(MyCreditCardInitialState());
    var box = await Hive.openBox('cardDataBox');
    box.clear();
    box.add(
      CreditCardModel(
        bgImage: imgurl,
        cardHolderName: cardholder.text,
        cardNumber: cardnumberController.text,
        expiryDate: exipryController.text,
        cvv: cvvcontroller.text,
      ),
    );
    print('qoshildi');
  }
}
