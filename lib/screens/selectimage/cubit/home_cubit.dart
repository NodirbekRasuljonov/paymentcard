import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paymentcard/core/data/images_data.dart';
import 'package:paymentcard/screens/selectimage/state/home_state.dart';

class MyCreditCardCubit extends Cubit<MyCreditCardState> {
  MyCreditCardCubit() : super(MyCreditCardInitialState());

  XFile? image;
  final _picker = ImagePicker();

  String imgurl = ImagesData.allimages[0];
  double blurValue = 0.0;

  bool controlimages=false;



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

  void control(){
    controlimages=!controlimages;
    emit(MyCreditCardInitialState())
;  }
}
