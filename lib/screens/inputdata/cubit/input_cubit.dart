import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcard/screens/inputdata/state/input_state.dart';

class InputViewCubit extends Cubit<InputViewState>{
  InputViewCubit():super(InputViewInitialState());
}