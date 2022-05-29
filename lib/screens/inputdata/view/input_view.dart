import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcard/core/extensions/size_extension.dart';
import 'package:paymentcard/screens/inputdata/cubit/input_cubit.dart';
import 'package:paymentcard/screens/inputdata/state/input_state.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InputViewCubit,InputViewState>(
        builder: (context, state) {
          return inputBody(context);
        },
        listener: (context, state) {},
      ),
    );
  }

  SizedBox inputBody(BuildContext context) => SizedBox(
        height: context.h,
        width: context.h,
      );
}
